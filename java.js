zielonepokoje = ["sala wideo","ruchomy pokój","sterownia","pokój z tunelem","komora robotów","komora regeneracji"]
żółtepokoje = ["pokój z wirem","cela","ciemny pokój","komora chłodu","komora obrotowa","komora zakłócania","pokój ZRB","pokój luster"]
czerwonepokoje = ["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił"]
niebieskiepokoje = ["pokój centralny","pokój 25","pokój kontrolny"]

document.getElementById("wyborpokoi").addEventListener("submit", (e) => {
    e.preventDefault();
    const ilosczielonych = document.getElementById("zieloneinput").value
    const iloscżółte = document.getElementById("żółteinput").value
    const iloscczerwonych = document.getElementById("czerwoneinput").value
    document.getElementById("wyborpokoi").style.display = "none"
    
  });