# Programozási Nyelvek (ADA), Generic Zárthelyi Dolgozat
A feladat két részből fog állni, egy sabloneljárás implementálásából és egy HashMap container létrehozásából genericek segítségével. A feladat megoldása folyamán kérjük, hogy jegyenként hozzanak létre egy új mappát, amelyben az adott jegyért csinálják meg a feladatot. (Például a /3 mappában a programnak kettesért is és hármasért is kell működnie.) Így például ha a hármas alrész működik, de a kettes nem, akkor megbukott. Így ajánlott jegyenként haladni. A végén a gyakorlatvezető osztályoz! A funkcionális helyesség mellett a megoldás nyelvi szépségét, a tanult nyelvi elemek használatának profizmusát is ugyanolyan hangsúllyal beszámítjuk az értékelésbe!

A megoldáshoz használható az Ada Language Reference Manual itt

## Kettesért
Definiáljon egy sabloneljárást, amely segítségével egy bemenő tömb azon elemeit gyűjti ki egy új tömbbe, amely egy adott feltételt teljesít.

A sabloneljárás neve legyen Filter_Value. Sablonparaméterként kell átadni egy indefinit tömb típust (Item_Array) az elemek (Item) és indexek (Index) típusával, valamint egy Condition függvényt, mely az Item típuson értelmezett predikátum. (Kötelező ezeket az azonosítókat használni!)

A sabloneljárásból példányosítható eljárásnak két paramétere legyen ebben a sorrendben: egy tömb (bemenő), és egy másik kimenő tömb. A feladat, hogy a bemenő tömb minden elemén alkalmazva a Condition függvényt, ha igazat add vissza akkor tegyük bele az új tömbbe. (Vegyük figyelembe, hogy a bemenő és a kimenő tömb típusa ugyanaz.)

A demo, egy előzetesen kinullázott tömbbe, tegye át egy egészeket tartalmazó tömbből a pozitív elemeket.

## Hármasért
Definiáljon egy sabloncsomagot, amelyben egy HashMap (magyarul leképezés ) átlátszatlan típust valósítja meg: ez egy olyan adatszerkezet, amely értékeket tartalmaz a hash helyen. Elsőként csak a Put és Size műveleteket kell elkészíteni hozzá. Az előbbi elhelyez egy értéket a leképezésben a hash helyen, az utóbbi pedig lekéri, hogy aktuálisan hány elem található a HashMap-ben. Gondoskodjunk arról is, hogy a HashMap típusnak nincs egyéb művelete, például =.

A leképezések típusát a HashMaps sabloncsomagban kell definiálni. A sablon paraméterei a kulcsok (Key), az értékek (Value) (melyek nem korlátozott, definit típusok), egy tömb (Hash_Array) amely Pozitív típussal van indexelve és értékeket (Value) tárol, a hash (Hash) függvény és egy default érték (noValue) amely (Value) típusú. A Hash függvény a Key típusról Positive típusra alakít át.

A sabloncsomag példányosításával kapható csomagban legyen a HashMap típus, melynek diszkriminánsa (Capacity) azt mondja meg, hogy legfeljebb hány értéket lehet a leképezésben eltárolni.

A HashMap típus reprezentálására használjunk egy darab diszkriminánsos rekordot. Ennek a diszkriminánsos rekordnak a belső állapotában egy olyan tömb fog szerepelni, amely Value értékeket tárol és Positive értékekkel indexxel. A tömb reprezentációjakor töltsük fel minden elemét noValue értékkel. Ez a Value azt fogja jelenteni, hogy jelenleg azon a helyen nincs érték. (Olyan mintha üres lenne.)

A HashMap típus Put művelete kapjon egy HashMap típusú be- és kimenő paramétert, valamint egy kulcs és egy érték paramétert. Elsőkörben a Hash függvény segítségével számítsuk ki a Hash értéket. Ellenőrizzük, hogy a tömb Hash érték helyén található-e elem. Abban az esetben noValue-es elem található ott akkor írjuk felül az érték paraméterrel.

A Size függvény kapjon egy HashMap típusú bemenő paramétert és a HashMap aktuális méretével térjen vissza.

A demo töltsön fel egy 10-es méretű HashMap-et 5 elemmel (noValue -1 legyen, a Hash függvény pedig abszolút értéket számoljon) majd írjuk ki a méretet.

## Négyesért
Definiáljunk a következő függvényeket a HashMaps sabloncsomagon belül.

Implementáljuk a ContainsKey függvényt, amely segítségével eldöntjük egy Key tipusról, hogy szerepel-e a tömbben. A függvény kapjon egy HashMap típusú bemenő paramétert, valamint egy Key típusú értéket. Először számoljuk ki a Hash függvény segítségével a Hash értéket. Ellenőrizzük, hogy a tömb Hash érték helyén található-e elem. Abban az esetben noValue-es elem található ott akkor adjunk vissza hamisat egyébként igazat.

Változtassa meg az Put függvényt, úgy hogy használja a ContainsKey függvényt.

Továbbá írjunk egy Values függvényt, amely a HashMap értékeit (Value) visszaadja. Erre használjuk a korábban már megírt Filter_Value sabloneljárást. (Ez azt jelenti, hogy abban az esetben, ha nem a Filter_Value sabloneljárást használja akkor a megoldást nem fogadható el!)

A demo teszteljen létező és nem létező kulcs értékeket, majd a Values függvényt.

## Ötösért
Készítsen For_Each belső iterátort a HashMap típushoz. A For_Each legyen egy sabloneljárás a HashMaps sabloncsomagban. Sablonparaméterként kapjon egy olyan (Action nevű) eljárást, amelynek egy érték típusú bemenő és kimenő paramétere van. A For_Each példányosításából származó eljárások kapjanak paraméterként egy HashMap-et, és alkalmazzák az ebben a leképezésben található értékekre az Action sablonparaméternek megfeleltetett eljárást.

Írjon egy Remove eljárást, amely segítségével a HashMap egy elemét ki tudjuk törölni a containerből. A Remove kapjon paraméterként egy HashMap be- és kimenő paramétert és egy Key típusú kulcsot. A feladat, hogy a Hash függvény segítségével határozzuk meg a Hash értéket és a container azon elemét amely a Hash érték segítségével van definiálva írjuk felül noValue-re. Így ezzel definiáltunk egy törlés metódust a HashMap-hez.

A demo írja ki a HashMap tartalmát, töröljön pár elemet, majd írja ki újból.

Jó munkát kívánunk, az Oktatók és Demonstrátorok