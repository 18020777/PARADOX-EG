import {initPrices} from "./prices.js"
import {initPlayers} from "./players.js"
import {initTime} from "./time.js"

const Booking = async () => {
    if (document.querySelector("#booking")) {
        const scenarioField = document.getElementById("id_scenario")
        const dateField = document.getElementById("id_date")
        const timeField = document.getElementById("id_time")

        initPrices()
        initPlayers()
        initTime()
    }
}

export {Booking}