---
layout: page
title: Unidade08
permalink: /unidade08/
nav_order: 8
---
Unidade 08: Mantemento de sistemas microinformáticos 
--- 

<h3>Elementos da unidade</h3>


<ul>
 {% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "unidade08" %}
        <ul>
          <li>
             <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </li>
          
        </ul>
   {% endif %}
  {% endfor %}
</ul>