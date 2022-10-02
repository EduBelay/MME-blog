---
layout: page
title: Unidade03
permalink: /unidade03/
nav_order: 3
---
Unidade 03: xxxx
--- 

<h3>Elementos da unidade</h3>


<ul>
 {% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "unidade03" %}
        <ul>
          <li>
             <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </li>
          
        </ul>
   {% endif %}
  {% endfor %}
</ul>