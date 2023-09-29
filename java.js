zielonepokoje = ["sala wideo","ruchomy pokój","sterownia","pokój z tunelem","komora robotów","komora regeneracji"]
żółtepokoje = ["pokój z wirem","cela","ciemny pokój","komora chłodu","komora obrotowa","komora zakłócania","pokój ZRB","pokój luster"]
czerwonepokoje = ["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił"]
niebieskiepokoje = ["pokój centralny","pokój 25","pokój kontrolny"]

let ilePokoi=5
const pokoje = document.querySelector(".pokoje")
for(let i=0;i<ilePokoi;i++){
    for(let j=0;j<ilePokoi;j++){
        const pokoj = document.createElement("div")
        pokoj.setAttribute("class","pokoj")
    }
}

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
  }

document.getElementById("wyborpokoi").addEventListener("submit", (e) => {
    e.preventDefault();
    const ilosczielonych = document.getElementById("zieloneinput").value
    const iloscżółtych = document.getElementById("żółteinput").value
    const iloscczerwonych = document.getElementById("czerwoneinput").value
    tempzielone = zielonepokoje
    tempżółte = żółtepokoje
    tempczerwone = czerwonepokoje
    document.getElementById("wyborpokoi").style.display = "none"
    listapokoi = []
    for(i=0;i<ilosczielonych;i++){
        listapokoi.push(zielonepokoje[getRandomInt((zielonepokoje.length)-1)])
    }
    for(i=0;i<iloscżółtych;i++){
        listapokoi.push(żółtepokoje[getRandomInt((żółtepokoje.length)-1)])
    }
    for(i=0;i<iloscczerwonych;i++){
        listapokoi.push(czerwonepokoje[getRandomInt((czerwonepokoje.length)-1)])
    }
    console.log(listapokoi)



  });