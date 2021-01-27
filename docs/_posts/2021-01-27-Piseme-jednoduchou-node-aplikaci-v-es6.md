---
title: Píšeme jednoduchou NodeJS aplikaci v ES6+
date: 2020-01-26
author: CBRPNK
category: posts
tags:
 - Development
 - NodeJS
description: Co udělat pro to, aby vám při
image: https://drive.google.com/uc?export=download&id=1x7n4lQdqpAnoZzBVL9HA-3AbQYpeEO4T
---

<image-component imageUrl="https://drive.google.com/uc?export=download&id=1x7n4lQdqpAnoZzBVL9HA-3AbQYpeEO4T" imageHeight="300" />

# Píšeme jednoduchou NodeJS aplikaci v ES6+

Node JS aplikace se píšou neuvěřitelně rychle. Stačí poměrně běžná znalost javascriptu a můžete díky tomu psát jednoduše škálovatelné prográmky nebo server-side aplikace. Jedinou nevýhodou, která vám může zkazit radost je, že Node dovoluje psát aplikace pouze v čistém ES5 javascriptu, takže příjdete o syntaktický cukr (arrow funkce nebo dokonce ES6 funkce typu reduce nebo filter).

Jenže s omezenými prostředky se nenecháme dneska svazovat a pokusíme se připravit si prostředí pro vývoj aplikace hodný roku 2021.

Nejdříve začneme s přípravou projektu. Pro lepší přehlednost převezmu z návodu dole i bash terminál.

1. <a href="https://nodejs.org/en/download/" target="_blank">Instalace NodeJS</a> pokud ho ještě nemáte, ale o tom pochybuji

2. Vytvoříme adresář s NodeJS aplikací
```bash
mkdir nodeapp && cd nodeapp && npm init -y
```

3. Nainstalujeme závislosti potřebné pro vývoj v ES6
```bash
npm install --save-dev @babel/core @babel/cli @babel/preset-env nodemon rimraff
```

4. Přídáme build skript do package.json
```js
"scripts":{
  "build": "babel src -d dist"
}
```

5. Vytvoříme si .babelrc soubor v kořenovém adresáři a přidáme následující obsah
```js
{
  "presets": ["@babel/preset-env"]
}
```
  * Jedná se o nastavení transpileru Babelu, jeho neuvěřitelné možnosti si můžete pokoumat na webu <a href="https://babeljs.io/setup" target="_blank">Babel.com</a>

6. Vytvoříme si src adresář a index.js soubor, který je entry point naší budoucí aplikace
```bash
mkdir src && touch src/index.js
```

7. Pro automatizaci workflow doporučuji zapracovat i nodemon

  * Nodemon je nástroj od Babelu, který umí sledovat změny v souborech a na jejich základě přebuilduje Dev prostředí bez nutnosti zásahu vývojáře.
  * Rimraf je Nodejs nástroj pro jednoduché mazání souborů

package.json
```js
"scripts": {
  "build": "babel src -d dist/index.js"
  "start": "npm run build && node dist",
  "restart": "rimraf dist && npm run start",
  "dev": "nodemon --exec npm run restart"
}
```

```bash
touch nodemon.json
```

nodemon.json
```js
{
  "watch": ["src"]
}
```

8. Hotovo, aplikaci můžeme spustit příkazem
```bash
npm run dev
```

  * Nebo vybuildovat pro produkční prostředí
```bash
npm run build
```
Zdroj: <a href="https://dev.to/mixed_code/set-up-node-project-in-es6-2bla" target="_blank">https://dev.to/mixed_code/set-up-node-project-in-es6-2bla</a> Díky moc autorovi
