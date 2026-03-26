---
title: "Jak jsem si chtěl přečíst knihu..."
date: 2026-03-26T14:42:11+01:00
slug: "2026-03-26-ebook-translator"
categories: ["CZ", "programming"]
tags: []
params:
  metadescription: ""
  metakeywords: ""
---

> This text is in czech - I know - its mostly for my czech friends, who asked me about the progress
> (ye, we have a little fun about my "I just want to read one book" in the pub). GPT can translate
> it for you 🍻

## Všechno to začalo naprosto nevinně

Chtěl jsem si přečíst knihu. V cizím jazyce. Jenže autor měl zjevně pocit, že bez archaických výrazů
a květnatých metafor v každém druhém odstavci jeho dílo postrádá duši. Já měl zase pocit, že bez
slovníku nepochopím ani obsah předmluvy (opravdu! - Německé _Geschichtsaufarbeitungsprozess_ je
prostě miláček).

„V pohodě,“ řekl jsem si. „Máme 21. století. Hodím to do GPT, ať mi to přeloží s trochou toho
žánrového cítění, a za deset minut čtu.“

Jenže GPT mi dalo jasně najevo, co si o mém „velkém souboru“ a mé verzi zdarma myslí. V podstatě mě
poslalo někam s tím, že na takové romány nemá náladu ani kontextové okno.

## „Jenom malý skriptík“

Nasral jsem se. Otevřel jsem VS Code a za pár minut vyplivl jednoduchý Python skript. Rozbít text na
kusy, poslat to přes API, zase to spojit. Vstupní parametr? Cesta k souboru. Nebo víš co? Uděláme
tam rovnou okýnko na výběr souboru, ať to vypadá k světu[^1].

## „Když už jsem v tom...“

Když už to umělo překládat, přišlo mi blbý tam nemít volbu jazyka. A když už tam byla volba jazyka,
chtělo to i políčko na vlastní prompt, abych mohl modelu vysvětlit, že nechci strojový překlad
návodu na pračku, ale atmosférický sci-fi noir. A co když spadne internet? Přidal jsem logiku pro
ukládání progresu, aby se dalo pokračovat tam, kde to lehlo.

## „Engine kam se podíváš“

V tu chvíli se ozvalo moje vnitřní inženýrské já: „A co když Gemini dává lepší výsledky? A co
DeepL?“ Tak jsem tam přidal podporu pro další enginy. Najednou jsem neměl skript na čtení knihy, ale
multimodální překladatelskou platformu.

## „Mělo by to i mluvit, ne?“

U chunkování textu mě napadlo, že od překladu je jen krůček k TTS (Text-to-Speech). Vždyť ty kousky
textu už mám připravené! Tak jsem tam přidal modul, co to sype do MP3. Ale číst to musí dávat smysl,
takže jsem musel přepsat logiku rozbíjení textu, aby to respektovalo nadpisy a odstavce. Robustnost
především.

## „Moderní backend je základ“

Protože spouštět to přes terminál jako nějaký neandrtálec mě přestalo bavit, řekl jsem si, že si
vyzkouším [GraphQL v Pythonu](https://strawberry.rocks/). Udělal jsem
[server](https://fastapi.tiangolo.com/), který přijímá parametry, volá ty moje skripty, procesuje
výstupy a vrací to přes API.

## Aktuální stav: Diagnóza

Knihu jsem stále nepřečetl. Nejsem ani za první kapitolou.

Místo toho teď sedím nad návrhem Frontendové aplikace, která se na to bude připojovat. Samozřejmě
tam musím dodělat správu uživatelů a kreditový systém, protože tyhle srandy přes API něco stojí a
nehodlám dotovat zbytek světa, až se to rozhodnu releasnout.

_Závěr?_ Chtěl jsem si přečíst knihu. Teď buduju SaaS platformu pro orchestraci AI modelů. Jestli se
mi někdy podaří dočíst tu první kapitolu, pravděpodobně k tomu napíšu skript, který tu knihu rovnou
zfilmuje... v té době už by to AI mely být schopny udělat dobře.

Kdyby se někdo chtěl k projektu připojit:
[Zde je GIT repo ](https://github.com/alfonsZelicko/python-ebook-reader)

> ... a ano - po cestě jsem se naučil mnoho zajímavých věcí: [Strawberry](https://strawberry.rocks/)
> lib, nuance v modelech pro [COQUI](https://github.com/coqui-ai/tts), jak klonovat hlas, pracovat s
> [Google AI studio](www.https://aistudio.google.com)[^2] a jak otravné je vyvýjet, když mi nikdo
> nešlape na krk s roadmapou :-D

[^1]:
    Původně jsem to chtěl sepsat chronologicky, abych mohl průběžně text prokládat odkazy na
    konkrétní commit messages, ale to by bylo opravdu hodně práce. Navíc jsem je nevedl tak čistě,
    jak bych si přál.

[^2]:
    to by konec koncu zvladlo celou tuhle praci obstarat v ramci sveho ekosystemu -> za relativne
    drobne, ale ja si to chtěl osahat :-)
