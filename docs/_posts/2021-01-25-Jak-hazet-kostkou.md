---
title: Jak házet kostkou v javascriptu
date: 2020-01-25
author: CBRPNK
category: posts
tags:
 - Javascript
 - Kostka
description: Návod jak vyřešit házení kostkou v javascriptu
image: https://drive.google.com/uc?export=download&id=1uczLSeBjcuIO0jPavow6rQnbUMRMDgPB
---

<image-component imageUrl="https://drive.google.com/uc?export=download&id=1uczLSeBjcuIO0jPavow6rQnbUMRMDgPB" imageHeight="300" />
# Jak házet kostkou v javascriptu

Překvapuje mě, jak je to vlastně jednoduché. Stačí jenom provolat několik základních metod v javascriptu a je hotovo.

``` js
const DICE_SIDES_COUNT = 6;
const CORRECTIONAL_CONSTANT = 1;

return Math.ceil(Math.random() * DICE_SIDES_COUNT) + CORRECTIONAL_CONSTANT;
```

Je vidět, jak si s tím JS poradí. Bohužel vzhledem k tomu, že počítá od nuly, tak vždy vrací čísla v rozsahu 0 - 5. Proto musíme přidat korekční konstantu, která přidává k výsledku 1 a znormalizuje ho na standardní čísla, která jsou na kostce.

Ideální je si tu funkci zabalit do vlastní metody, která bude konfirgurovatelná podobně jako ukázka více, aby se nemuselo plýtvat časem a kódem :)
