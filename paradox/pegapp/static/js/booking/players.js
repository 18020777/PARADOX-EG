async function initPlayers() {
    const select = document.getElementById("id_scenario")
    const textBox = document.getElementById("players_box")
    select.addEventListener("change", async () => {
        handleScenario(select, textBox)
    })
    handleScenario(select, textBox)
}

function displayText(textBox, scenario) {
    if (scenario) textBox.innerHTML = `min: ${scenario.min_players}, max: ${scenario.max_players}`
    else textBox.innerHTML = ""
}

async function getScenario(id) {
    const response = await fetch("/api/scenario/" + id)
    if (response.ok) return await response.json()
    else return null
}

async function handleScenario(select, textBox) {
    const id = select.value
    if (!id) return displayText(textBox, null)
    const scenario = await getScenario(id)
    displayText(textBox, scenario)
}

export { initPlayers };