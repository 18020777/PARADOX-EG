let Navbar;
Navbar = () => {
    let navbar = document.querySelector("#navbar")

    if (navbar) window.addEventListener("scroll", () => {
        if (window.scrollY === 0) navbar.classList.remove("backdrop-blur")
        else navbar.classList.add("backdrop-blur")
    })
}

export { Navbar };
