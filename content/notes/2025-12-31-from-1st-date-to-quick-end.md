---
title: "[cz] I have opinion: htmx suck"
date: 2025-12-31T14:23:47+01:00
slug: "2025-12-31-from-1st-date-to-quick-end"
categories: []
tags: ["cz", "programming"]
draft: true
params:
  metadescription: ""
  metakeywords: ""
---

## htmx: Cesta od memu k vystřízlivění

_...(aneb proč Lakatoš vyhrál nad bakelitovou károu)_

> **Disclaimer**: Původně jsem chtěl tenhle článek napsat anglicky - pro širší publikum. Ale čím víc
> jsem se v htmx vrtal, tím víc mi v hlavě zněla hláška: „Ku\*va, ani óčko nenásádíš, protože to je
> udělalbá!“ Pokud nevíte, o čem mluvím, [YouTube](https://www.youtube.com/watch?v=SiUz_akTmcY) vám
> to vysvětlí. Protože htmx mi toho Lakatoše připomíná víc, než by mi bylo milé a cizojazyčný čtenář
> by nechápal... nechám v češtině

{{< img src="htmx.png" alt="Love on 1st view" caption="Ucitil jsem nostalgii k necemu, co jsem ztratil" >}}

Znáte ten meme? V roce 2010 jsme měli PHP a jQuery a všechno bylo přímočaré... a bordel. Pak přišel
rok 2012 a JS si chtěl vzít na starost celé to "V" v
[MVC](https://cs.wikipedia.org/wiki/Model-view-controller). Jenže velmi rychle se to cele utrhlo ze
řetězu a někdy kolem 2016 uz React byl cele to MVC[^1]. Miliony sub-frameworku, každý od jiného
výrobce, všechno drží po kupe silou vůle (a stovek `node_modules`) a motliteb po kazdem
`npm upgrade`[^2], a když se to rozbije, nikdo neví proč. Na debug chyby nestaci ani DevTool,
protoze nekonacna rada anonymnich volani asynchronich funkci, zacinajici az nekde v pekle, proste
nedava smysl...

... A pak se na scéně objevil **htmx**. Sliboval přesně to, co jsme všichni chtěli: rychlej, easy to
use, moderni framework.

{{< img src="new-framework-promise.png" w="420" alt="meme - novy framework - inspired by IT" caption="Dalsi nove reseni starych chyb na scene!" >}}

### Fáze 1: Líbánky (Smažte 15 000 řádků kódu!)

Moje cesta začala nadšením. Viděl jsem přednášku z
[DjangoConu 2022](https://www.youtube.com/watch?v=3GObi93tjZI), kde David Guillo barvitě popisoval,
jak vyhodili React, smazali 15 000 řádků kódu a zbavili (asi ?) 250 zavislosti a jejich život se
stal barevnějším. „Žádné API kontrakty! Žádná duplicita typů! Prostě pošlete HTML fragment a htmx ho
tam vlepí!“

Znělo to jako spása. Žádný TypeScript overhead, žádné řešení stavu na frontendu. Jen vy a váš
backend. Tak jsem to zkusil protáhnout vlastním „framework stress testem“.

### Fáze 2: První trhliny v omítce

Jenže pak začnete stavět něco víc než jen „Hello World“. A začne to drhnout.

První věc, která mě zarazila, byla **architektonická nekonzistence**. Zjistíte, že `hx-get` se v
různých kontextech chová jinak. Jednou očekáváte, že se přepíše celý element, jindy jen vnitřek, a
najednou se přistihnete, že do HTML atributů píšete logiku, která by tam nikdy neměla být.

Jakmile potřebujete, aby jedno kliknutí zaktualizovalo tři různé části stránky, které spolu
nesouvisí, začne ta „jednoduchost“ bolet. Buď musíte používat `hx-swap-oob` (out-of-band), což je v
podstatě „goto“ příkaz pro HTML, nebo začnete na serveru skládat podivné slepence, které rozbíjejí
jakoukoli čistotu kódu.

#### ...ale at se bavime vecne:

1.  **"OOB" (Out-of-Band) Peklo** V htmx je "čistá cesta" taková, že klikneš na tlačítko a ono se
    samo nahradí novým HTML. Jenže v reálné aplikaci klikneš na "Přidat do košíku" a chceš:
    - Změnit text tlačítka.
    - Aktualizovat ikonku košíku v headeru.
    - Zobrazit notifikaci v rohu.

      ... V htmx to znamená poslat ze serveru slepenec HTML, kde jsou tyhle tři věci rozházené a
      označené `hx-swap-oob="true"`.

> "Místo čistého JSONu, který si frontend zpracuje, posíláte ze serveru 'teleporty' kousků HTML.
> **Gratuluji, právě jste vynalezli GOTO v roce 2024**, jen tomu říkáte hypermedia."

2. **Ztráta "Single Source of Truth"** V Reactu/Vue víš, že stav aplikace je v JS. V htmx je stav...
   kde? Trochu v databázi, trochu v URL, trochu v DOMu a trochu v hlavě programátora, který si musí
   pamatovat, co se stane, když uživatel klikne na Back v prohlížeči.

> "Zkuste v htmx vyřešit tlačítko 'Zpět', aniž by se vám rozskočila hlava nebo se stránka nevrátila
> do nějakého polorozpadlého stavu z mezipaměti."

3. **Debugging v "Network Tabu"** Ladění htmx je jako sledování Matrixu.

### Fáze 3: Shock z codebase a vystřízlivění

Začal jsem pochybovat. Pak jsem ale narazil na texty a videa, které mi potvrdily, že nejsem blázen:

1. **Chris Done** a jeho [brilantní kritika](https://chrisdone.com/posts/htmx-critique/): htmx sice
   maže kód na frontendu, ale za cenu toho, že vytváří neudržitelný propletenec (coupling) mezi
   serverem a klientem.
2. **The Primeagen** a jeho [vystřízlivění z htmx](https://www.youtube.com/watch?v=9AtijVV11SA):
   htmx selhává v momentě, kdy potřebujete synchronizovat stav na klientovi. Což je dneska skoro
   každý moderní web.
3. Sám autor v eseji [htmx sucks](https://htmx.org/essays/htmx-sucks/) přiznává, že je to ošklivý
   hack.

### Fáze 4: Syntéza – Lakatoš vs. Hliníková kára

Můj verdikt? htmx je úžasné demo, ale nebezpečný produkt.

Pojďme si promluvit o **ladění**. Všichni víme, že debugovat React je čistý masochismus. Callstack
vypadá jako scénář k [Tennet](https://www.csfd.cz/film/693159-tenet/prehled/) a bez
[React Dev Tools](https://chromewebstore.google.com/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
jsi v háji. ALE: ukaze se ti velka cervena chyba a kdyz zahodis hrdost a celej ten callstack zkopcis
do AI, tak to celkem dava smysl. Jenže u htmx? Tam jsi v háji ještě hlouběji.

Když se něco rozbije v htmx, ladíš v jeden moment **svatou trojici chaosu**: server, klienta a
samotnou knihovnu. Koukáš do Network tabu na ty HTML fragmenty, pak skáčeš do backendových šablon a
nakonec zjistíš, že věc, která tě vytáčí, není chyba, ale **feature**. Feature, kterou už dva roky
všichni nenávidí, existuje na ni 242 342 hacků, a v praxi ji tím „původním“ způsobem nepoužívá
nikdo... a to vse za predpokladu, ze zjistis, ze to je rozbite - htmx s tebou chyby komunikuje dost
podobne jako spolu mluvi pary po 20-ti letech[^1]...

- **Moderní stack (React/Next)** sice vypadá jako ten převrtanej Lakatoš, kde teče olej a polovina
  věcí je tam navíc, ale když se něco rozbije, aspoň máš diagnostiku. Víš, kde končí data a kde
  začíná UI.
- **htmx** je hliníková kára. Super na to, když vezeš nákup z Lidlu za roh, ale na dálnici s tím
  nechceš. Protože na dálnici se ta kára začne klepat, upadne jí kolo a ty zjistíš, že tvůj „návrat
  ke kořenům“ je ve skutečnosti jen návrat do éry, kdy jsme sice psali míň kódu, ale víc jsme pili,
  abychom z toho nezešíleli.

### Závěr: Návrat k rozumu

Nenechte se opít memy. htmx není revoluce. Je to nostalgický výlet, který nám připomněl, že HTML je
mocné, ale taky nám ukázal, proč jsme ty moderní frameworky vlastně postavili.

Budu htmx dál sledovat? Určitě, ty memy jsou skvělé. Použiju ho na příští velký projekt? Ani
náhodou. Raději si nechám toho svého Lakatoše. Je sice složitej, ale aspoň vím, že mě nenechá ve
štychu, když se cesta začne klikatit.

[^1] Na začátku geniální nápad: „uděláme masivní JS framework, server bude jen hloupý dodavač dat a
žádné skládání HTML“. O chvíli později ještě geniálnější pokračování: „a když už to máme, tak ten
server stejně zatížíme — poběží na JS a bude to HTML skládat taky“. A vznikl Next.JS
https://en.wikipedia.org/wiki/Next.js

[^2] A ted nemluvim jen o klasicke motlitbe, jestli tam vyvojari OMYLEM nezanesli nejakej
bordel/nekompatibilitu.. ale stare dobre
[trojany](https://www.blackduck.com/blog/recent-npm-software-supply-chain-attack-security-lessons.html)

[^] Ano, nasel jsem par videi, kde typek pouzival nejaky specializovany tool, ktery trochu pomuze -
ale presne jen tolik. TROCHU (dosad si ton z Lakatose: "A je to cele akorat tak NA P\*CU")
