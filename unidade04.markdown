---
layout: page
title: Unidade04
permalink: /unidade04/
nav_order: 4
---
Unidade 04: Análise do mercado de compoñentes microinformáticos. Placa base e periféricos.
--- 

<h3>Elementos da unidade</h3>


<ul>
 {% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "unidade04" %}
        <ul>
          <li>
             <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </li>
          
        </ul>
   {% endif %}
  {% endfor %}
</ul>