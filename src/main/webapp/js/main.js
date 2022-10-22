const button = document.getElementById("clearButton")
button.addEventListener("click", (event)=>{
        window.location = "/enterprises/all";
})

const reorder = () => {
    const frag = document.createDocumentFragment();
    const list = document.querySelector("h5");
    const items = list.querySelectorAll("a");
    const sortedList = [enterpriseList].sort((a, b) => {
        const c = a.textContent,
            d = b.textContent;
        return c < d ? -1 : c > d ? 1 : 0;
    });
    for (const item of sortedList) {
        frag.appendChild(item);
    }
    list.appendChild(frag);
}

const button = document.getElementById("alphaButton")
button.addEventListener("click", (event)=>{
reorder()
    window.location = "/enterprises/all";
})








