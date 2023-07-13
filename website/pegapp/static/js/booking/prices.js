async function initPrices() {
    const field = document.getElementById("id_num_players")
    const textBox = document.getElementById("price_box")
    const prices = await getPrices()
    if (!prices) return
    console.log(prices);
    displayPrice(field, textBox, prices[field.value])
    field.addEventListener("change", () => displayPrice(field, textBox, prices[field.value]))
}

function displayPrice(field, textBox, price) {
    if (price) textBox.innerHTML = price * field.value
}

async function getPrices() {
    const response = await fetch("/api/prices")
    const json = await response.json()
    if (response.ok) return json.results[0].prices
    else return null
}

export {initPrices};