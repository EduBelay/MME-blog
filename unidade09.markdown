---
layout: page
title: Unidade09
permalink: /unidade09/
nav_order: 9
---
Unidade 09: Novas tendencias en equipamentos microinformáticos
--- 

<h3>Elementos da unidade</h3>


<ul>
 {% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "unidade09" %}
        <ul>
          <li>
             <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </li>
          
        </ul>
   {% endif %}
  {% endfor %}
</ul>