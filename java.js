zielonepokoje = ["sala wideo","ruchomy pokój","sterownia","pokój z tunelem","pokój z tunelem","pokój z tunelem","komora robotów","komora robotów","komora regeneracji","komora regeneracji"]
żółtepokoje = ["pokój z wirem","cela","ciemny pokój","komora chłodu","komora obrotowa","komora zakłócania","pokój ZRB","pokój luster"]
czerwonepokoje = ["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił"]
niebieskiepokoje = ["pokój centralny","pokój 25","pokój kontrolny"]

let ilePokoi=5
const pokoje = document.querySelector(".pokoje")

for(let i=0;i<ilePokoi;i++){
    for(let j=0;j<ilePokoi;j++){
        const pokoj = document.createElement("div")
        pokoj.setAttribute("class","pokoj")
        pokoje.appendChild(pokoj)
    }
}

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
  }

document.getElementById("wyborpokoi").addEventListener("submit", (e) => {
    e.preventDefault();
    pokoje.style.display="grid"
    pokoje.style.gridTemplateColumns=`repeat(${ilePokoi}, 1fr)`
    pokoje.style.gridTemplateRows=`repeat(${ilePokoi}, 1fr)`
    pokoje.style.gap="5px"
    const ilosczielonych = document.getElementById("zieloneinput").value
    const iloscżółtych = document.getElementById("żółteinput").value
    const iloscczerwonych = document.getElementById("czerwoneinput").value
    tempzielone = zielonepokoje
    tempżółte = żółtepokoje
    tempczerwone = czerwonepokoje
    document.getElementById("wyborpokoi").style.display = "none"
    listapokoi = []
    for(i=0;i<ilosczielonych;i++){
        poko = tempzielone.splice(getRandomInt((tempzielone.length)-1),1)[0]
        if(poko){
            listapokoi.push(poko)
        }
        else{
            listapokoi.push("pusty pokój")
        }
        
    }
    for(i=0;i<iloscżółtych;i++){
        poko = tempżółte.splice(getRandomInt((tempżółte.length)-1),1)[0]
        if(poko){
            listapokoi.push(poko)
        }
        else{
            listapokoi.push("pusty pokój")
        }
    }
    for(i=0;i<iloscczerwonych;i++){
        poko = tempczerwone.splice(getRandomInt((tempczerwone.length)-1),1)[0]
        if(poko){
            listapokoi.push(poko)
        }
        else{
            listapokoi.push("pusty pokój")
        }
    }
    if(listapokoi.length<23){
        for(i=0;i<23-listapokoi.length;i++){
            listapokoi.push("pusty pokój")
        }
    }
    if(listapokoi.length>23){
        for(i=0;i<listapokoi.length-23;i++){
            listapokoi.pop()
        }
        
    }
    console.log(listapokoi)



  });