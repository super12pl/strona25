extends Node
var players := 4
var szeregi := 5
var kolumny := 5
var zieloneIndex := ["sala wideo","ruchomy pokój","pokój z tunelem","komora robotów","komora regeneracji","pusty pokój","sterownia"]
var zulteIndex := ["pokój z wirem","cela","ciemny pokój","komora chłodu","komora obrotowa","komora zakłócania","pokój ZRB","pokój luster"]
var czerwoneIndex := ["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił"] 

var tilesetIndex = [["pusty pokój","sala wideo","ruchomy pokój","sterownia","pokój z tunelem"],["komora regeneracji","komora robotów","pokój z wirem","cela","ciemny pokój"],["komora chłodu","komora obrotowa","fałszywe wyjście","pokój ZRB","pokój luster"],["wanna z kwasem","zalana komora","pokój pułapka","pokój iluzji","komora śmierci"],["pokój zegarowy","pokój paranoi","komora pił","komora zakłócania"],["pokój centralny","pokój szyfrowania","pokój 25"]]


var zielone = ["sala wideo","ruchomy pokój","pokój z tunelem","pokój z tunelem","pokój z tunelem","komora robotów","komora robotów","komora regeneracji","komora regeneracji","sterownia"]
var żółte = ["pokój z wirem","pokój z wirem","cela","cela","ciemny pokój","ciemny pokój","komora chłodu","komora chłodu","komora obrotowa","komora obrotowa","komora zakłócania","pokój ZRB","pokój ZRB","pokój luster"]
var czerwone = ["wanna z kwasem","wanna z kwasem","zalana komora","zalana komora","pokój pułapka","pokój pułapka","pokój iluzji","komora śmierci","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił","komora pił"]
var pulaPokoi = ["sala wideo","ruchomy pokój","pokój z tunelem","pokój z tunelem","pokój z tunelem","komora robotów","komora robotów","komora regeneracji","komora regeneracji","sterownia","pokój z wirem","pokój z wirem","cela","cela","ciemny pokój","ciemny pokój","komora chłodu","komora chłodu","komora obrotowa","komora obrotowa","komora zakłócania","pokój ZRB","pokój ZRB","pokój luster","wanna z kwasem","wanna z kwasem","zalana komora","zalana komora","pokój pułapka","pokój pułapka","pokój iluzji","komora śmierci","komora śmierci", "pokój paranoi","pokój zegarowy","komora pił","komora pił"]
@onready var width := get_window().size.x
@onready var height := get_window().size.y

var plansza = []

#nie dotykać
var reloaded = false

var wybraneRuchy = []

func _ready():
	get_window().size = Vector2i(width,height)




















#schizo train 
var tileExplanation = [
	["pokój pusty brak rozpusty kurwa sperma","Obejrzyj dowolny kaflek pomieszczenia
i odłóż go z powrotem, nie zdradzając innym jego
treści.","Po wejściu weź kafelek wraz z figurką i zamień miejscami
z dowolnym zakrytym pomieszczeniem na planszy.
Pomieszczenie to pozostaje zakryte. Jeśli wszystkie
pomieszczenia są już odkryte, Ruchomy pokój nie ma
żadnego efektu.","Przesuń wybrany szereg/kolumnę (niezawierające
Pokoju Centralnego) w wybranym kierunku o jedną
pozycję.","Natychmiast przesuń swoją postać do innego
odkrytego Pokoju z tunelem (jeśli taki istnieje)."],["Kiedy jakaś postać wejdzie do Komory regeneracji w momencie, w którym z gry zostały
już wyeliminowane jakieś postacie, aktywuje
ją. Jeśli żadna postać nie została wyeliminowana, wejście postaci nie aktywuje Komory
regeneracji, a tylko ją odkryje.
Kiedy to pomieszczenie zostanie aktywowane,
wszystkie wyeliminowane z gry postacie
wracają natychmiast do pokoju centralnego.
Kiedy do tego dojdzie, Komora regeneracji
zostanie zniszczona.
Gracze, których postacie zostały przywrócone do życia, będą mogli zaprogramować
swoje akcje na początku następnej rundy.
Ich znaczniki kolejności należy ponownie
odwrócić czaszką ku dołowi. Jeśli ich znaczniki kolejności usunięto już z planszy, należy
je na niej ponownie umieścić w taki sposób,
aby wykonywali swoje tury jako pierwsi, ale
by liczba pozostałych do końca gry rund nie
uległa zmianie.","Za każdym razem, gdy do tego pomieszczenia
wejdzie jakaś postać, wykonaj 2 poniższe akcje:
• Jeśli w budynku nie ma robota, umieść go
w tym pomieszczeniu.
• Wydaj rozkaz dowolnemu robotowi znajdującemu się w budynku (bez względu na dzielącą
pomieszczenia odległość). To może być rozkaz
ruchu albo wypchnięcia (patrz strona 2).","Przenieś figurkę swojej postaci do Pokoju centralnego","Możesz opuścić Celę tylko na dwa sposoby: przechodząc do sąsiedniego pomieszczenia zajętego
przez inną postać albo do Pokoju centralnego,
jeżeli sasiaduje z Celą","Gdy znajdujesz się w tym pomieszczeniu, nie
możesz wykonywać akcji Obserwacji."],["Gdy znajdujesz się w tym pomieszczeniu
w fazie Programowania, możesz zaplanować tylko
jedną akcję. Dotyczy także ujawnionego strażnika.","Kiedy jakaś postać albo robot wejdzie do
Komory obrotowej, należy ją ustawić w taki
sposób, aby długi korytarz znajdował się
w linii prostej z pomieszczeniem, z którego ta
postać lub robot do niej weszli.
To pomieszczenie składa się z obrotowego
korytarza, który ma tylko 2 wyjścia (zamiast 4).
Znajdująca się w tym pomieszczeniu postać
może poruszać się, obserwować i wypchnąć
inne postacie jedynie przez te 2 wyjścia. Ustawienie korytarza nie wpływa na inne zdolności
i akcje sterowania.","sperma","Natychmiast wylosuj kartę z talii Z.R.B.
i zastosuj jej efekt.
Jeśli efekt odnosi się do jednej lub kilku konkretnych postaci (na przykład została wylosowana karta kary), zastosuj go tylko do swojej
postaci.","Tracisz swój żeton adrenaliny. Jeśli zaprogramowałeś na tę rundę inne akcje, zostają one
anulowane. Twoja tura dobiega końca. Podczas następnej fazy Programowania możesz
normalnie programować akcje."],["Gdy tylko w pomieszczeniu znajdą się dwie postacie,
ta z nich, która znalazła się w nim wcześniej, zostaje
natychmiast wyeliminowana.","Po odkryciu pomieszczenie staje się już do końca
gry niedostępne. Jeśli na koniec Twojej następnej
tury Twoja postać nadal przebywa w tym pomieszczeniu, zostaje wyeliminowana.","Jeśli na koniec Twojej następnej akcji Twoja postać
nadal przebywa w tym pomieszczeniu, zostaje wyeliminowana.","Natychmiast zamień miejscami Pokój iluzji
z dowolnym zakrytym pomieszczeniem na
planszy. Odkryj to drugie pomieszczenie
i umieść w nim swoją postać oraz zastosuj jego
efekt. Tym samym Pokój iluzji zmienia miejsce,
ale zawsze pozostaje już odkryty. Jeśli wszystkie pomieszczenia są odkryte, Pokój iluzji nie ma
efektu.","Kiedy Twoja postać wchodzi do
tego pomieszczenia, zostaje
natychmiast wyeliminowana."],["Jeśli postać wejdzie do tego pomieszczenia przed ostatnią rundą, odliczanie należy
przyspieszyć o 1 rundę – wszystkie znaczniki kolejności należy przesunąć o 1 pole bez
zmieniania ich kolejności.
Jeśli postać wejdzie do tego pomieszczenia
w ostatniej rundzie, efekt będzie inny. Taka
postać zostanie natychmiast wyeliminowana
z gry, a odliczania nie należy przyspieszać.
W obu przypadkach Pokój zegarowy należy
usunąć z gry i zastąpić Pustym pomieszczeniem.","Gdy wejdziesz do tego pomieszczenia,
pomieszaj wszystkie swoje żetony akcji (w tym
te, z których korzystałeś podczas tej rundy)
i utwórz z nich stos. Podczas swoich tur losuj
żeton z wierzchu stosu, wykonuj daną akcję
i odrzucaj dany żeton.
Jeśli Twój stos żetonów się wyczerpie, paranoja skończy się na początku Twojej następnej fazy Programowania. Paranoja skończy
się również w momencie opuszczenia tego
pomieszczenia. Jeśli w tej ostatniej sytuacji opuściłeś Pokój paranoi swoją pierwszą
akcją, podczas swojej drugiej akcji nadal
musisz wylosować żeton ze stosu.
Jeśli podczas swojej pierwszej akcji zużyłeś
ostatni żeton ze stosu, nie musisz wykonywać
drugiej akcji.","Kiedy to pomieszczenie opuści jakaś postać
albo wejdzie do niego robot, jego efekt
zostaje aktywowany.
Pozostałe w pomieszczeniu postacie zostają
wyeliminowane, a pomieszczenie staje się
niedostępne do końca gry. Umieść na nim
żeton zakazu wstępu.
Tak jak w przypadku wszystkich czerwonych
pomieszczeń, robot, który wejdzie do Komory
pił, zostanie natychmiast zniszczony","Dopóki w tym pokoju znajduje
się jakaś postać, gracze nie
mogą wymieniać się informacjami, w tym rozmawiać o programowaniu i poziomie trudności pomieszczeń."],
 ["Pomieszczenie, w którym wszyscy
gracze rozpoczynają grę. Dozwolone
są tu jedynie akcje Obserwacji oraz
Ruchu. To pomieszczenie nie może
zostać przesunięte, pozostaje w centrum przez cały czas trwania gry","Z tego pomieszczenia korzysta
się tylko podczas rozgrywek
w Trybach Kooperacji i Solo.
To pomieszczenie zostaje
aktywowane, gdy wejdzie do
niego jakaś postać. Należy
je zastąpić pustym pomieszczeniem. Gracze nie mogą
opuścić budynku przez Pokój 25, dopóki Pokój kontrolny nie zostanie
aktywowany","Pomieszczenie wyjścia. Gdy wszyscy więźniowie znajdą się w środku,
jeden z nich musi użyć akcji Sterowania i wysunąć Pokój 25 poza
budynek."]]
