async function initTime() {
    const scenarioField = document.getElementById("id_scenario")
    const dateField = document.getElementById("id_date")
    const timeField = document.getElementById("id_time")
    scenarioField.addEventListener("change", async () => {
        await handleTimeField(scenarioField, dateField, timeField)
    })
    dateField.addEventListener("change", async () => {
        await handleTimeField(scenarioField, dateField, timeField)
    })
}

async function handleTimeField(scenarioField, dateField, timeField) {
    const scenario = scenarioField.value
    const date = dateField.value
    const selectedTime = timeField.value
    const timeChoices = await getTimeChoices(scenario, date)
    updateTimeField(timeField, timeChoices, selectedTime)
}

function updateTimeField(timeField, timeChoices, selectedTime) {
    if (timeChoices) {
        timeField.options.length = 0
        const emptyTime = document.createElement("option")
        emptyTime.text = "---------"
        timeField.add(emptyTime)
        timeChoices.forEach(time => {
            const newTime = document.createElement("option")
            newTime.value = time[0]
            newTime.text = time[1]
            timeField.add(newTime)
            if (selectedTime == time[0]) timeField.value = selectedTime
        });

    }
}

async function getTimeChoices(scenario, date) {
    if (scenario && date) {
        const response = await fetch("/api/availability/?scenario=" + scenario + "&date=" + date)
        console.log(response)
        if (response.ok) return await response.json()
        else return null
    }
    else return null
}

export { initTime };