---
layout: page
title: Unidade06
permalink: /unidade06/
nav_order: 06
---
Unidade 06: Instalación de sistemas operativos
--- 

<h3>Elementos da unidade</h3>


<ul>
 {% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "unidade06" %}
        <ul>
          <li>
             <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </li>
          
        </ul>
   {% endif %}
  {% endfor %}
</ul>

# Descarga de distribucións de referencia 
* [Windows11](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-11-enterprise)
* [Windows 10]()
* [Windows Server 2019](https://www.microsoft.com/es-es/evalcenter/download-windows-server-2019)
