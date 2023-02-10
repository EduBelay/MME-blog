---
layout: page
title: Portatiles
permalink: /portatiles/
nav_order: 91
parent: Taller
---
Portatiles: (inventario)
--- 



# Portatiles:

<ul>
 {% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "portatiles" %}
        <ul>
          <li>
             <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </li>
          
        </ul>
   {% endif %}
  {% endfor %}
</ul>


# Webs de axuda
- [ifixit Guías](https://es.ifixit.com/Gu%C3%ADa?)
- [Manualslib.com](https://www.manualslib.com/)
- [Guias de desmontaxe para portatiles Toshiba](http://www.irisvista.com/tech/)
- https://www.manualsbase.com/es
- [https://elektrotanya.com/ ](https://elektrotanya.com/ )
- [Manuais paso a paso: Nadie me llama gallina](https://nadiemellamagallina.com/)

# Tendas de compoñentes
- [Impextrom](https://www.impextrom.com/) [Vigo]
- [Ovisat](https://www.ovisat.com/) [Asturias]
- [Repuestos Fuentes](https://www.repuestosfuentes.es/) [Huelva]

# Inventario
1. Toshiba Satelite A300 - 1B1 [PSAJ4E - 00Q011C]
2. Toshiba Satelite  A100-999 [PSAARE-04K019SP]
3. Toshiba Satelite PRO  C50   - 153 [PSCG7E - 00P004CE]
4. Samsung NP-R522 
5. MSI MS-163C 
6. Compaq Presario CQ61  - WB906EA#ABE
7. Fujitsu  Amilo A1655G