zielonepokoje = ["sala wideo","ruchomy pokój","sterownia","pokój z tunelem","pokój z tunelem","pokój z tunelem","komora robotów","komora robotów","komora regeneracji","komora regeneracji"]
żółtepokoje = ["pokój z wirem","cela","ciemny pokój","komora chłodu","komora obrotowa","komora zakłócania","pokój ZRB","pokój luster"]
czerwonepokoje = ["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił"]
niebieskiepokoje = ["pokój centralny","pokój 25","pokój kontrolny"]

let ilePokoi=5
const pokoje = document.querySelector(".pokoje")
class gracz {
    constructor(akcja1,akcja2){
        this.akcja1=akcja1
        this.akcja2=akcja2
        this.Alive=true
    }
}


for(let i=0;i<ilePokoi;i++){//Gratuluje Szymonie
    for(let j=0;j<ilePokoi;j++){
        const pokoj = document.createElement("div")
        pokoj.setAttribute("class","pokoj")
        //jeśli jest to pokój na środku, daj mu klasę centralny
        if(j==Math.floor(ilePokoi/2)&&i==j){
            pokoj.classList.add("centralny")
            pokoj.innerText = "pokój centralny"
        }
        //jeśli jest to pokój w środkowym wierszu lub kolumnie lub sąsiadujący z centralnym, dodaj klasę wewnętrzny
        if(i==Math.floor(ilePokoi/2) ||j==Math.floor(ilePokoi/2) || ((i == Math.floor(ilePokoi/2)-1 || i == Math.floor(ilePokoi/2)+1)&&(j == Math.floor(ilePokoi/2)-1 || j == Math.floor(ilePokoi/2)+1))){
            pokoj.classList.add("wewnętrzny")
        }
        pokoje.appendChild(pokoj)
    }
}

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}
function shuffle(array) {
    let currentIndex = array.length,  randomIndex;
  
    // While there remain elements to shuffle.
    while (currentIndex > 0) {
  
      // Pick a remaining element.
      randomIndex = Math.floor(Math.random() * currentIndex);
      currentIndex--;
  
      // And swap it with the current element.
      [array[currentIndex], array[randomIndex]] = [
        array[randomIndex], array[currentIndex]];
    }
  
    return array;
}

document.getElementById("wyborpokoi").addEventListener("submit", (e) => {
    //zapobiega refresh strony
    e.preventDefault();
    //wyświetla pokoje na gridzie
    pokoje.style.display="grid"
    pokoje.style.gridTemplateColumns=`repeat(${ilePokoi}, 1fr)`
    pokoje.style.gridTemplateRows=`repeat(${ilePokoi}, 1fr)`
    pokoje.style.gap="5px"
    //pobiera ilosc pokoi
    const ilosczielonych = document.getElementById("zieloneinput").value
    const iloscżółtych = document.getElementById("żółteinput").value
    const iloscczerwonych = document.getElementById("czerwoneinput").value
    //tworzy tymczasowe listy pokoi
    tempzielone = zielonepokoje
    tempżółte = żółtepokoje
    tempczerwone = czerwonepokoje
    document.getElementById("wyborpokoi").style.display = "none"
    listapokoi = []
    for(i=0;i<ilosczielonych;i++){
        //losuje pokój z tymczasowej listy i go usuwa
        poko = tempzielone.splice(getRandomInt((tempzielone.length)-1),1)[0]
        if(poko){
            listapokoi.push(poko)
        }
        else{
            //jeśli skończą się pokoje, wypełń pustymi
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
        //jeśli ilosc pokoi jest mniejsza niż 23(jest jeszcze pokój centralny i 25) wypełnij pustymi
        for(i=0;listapokoi.length<23;i++){
            listapokoi.push("pusty pokój")
        }
    }
    if(listapokoi.length>23){
        //jeśli ilość pokoi jest większa niż 23 usuń pokoje z końca listy(pokoje czerwone)
        for(i=0;listapokoi>23;i++){
            listapokoi.pop()
        }
        
    }
    //podziel pokoje na dwie listy, wewnętrzne i zewnętrzne, do drugiego dodaj pokój 25 i oba pomieszaj
    listapokoiwewnętrznych = listapokoi.splice(Math.floor(listapokoi.length / 2))
    listapokoi.push("pokój 25")
    listapokoiwewnętrznych = shuffle(listapokoiwewnętrznych)
    listapokoi = shuffle(listapokoi)
    index1 = 0
    index2 = 0
    document.querySelectorAll(".pokoj").forEach(element => {
        //przejdź po każdym pokoju i przypisz mu wartość z odpowiedniej listy zależnie od klasy
        if(!element.classList.contains("centralny")){
            if(element.classList.contains("wewnętrzny")){
                element.innerHTML =listapokoiwewnętrznych[index1]
                index1++
            }
            else{
                element.innerHTML =listapokoi[index2]
                index2++
            }
            
        }
    });



  });
