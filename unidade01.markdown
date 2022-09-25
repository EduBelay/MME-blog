---
layout: page
title: Unidade01
permalink: /unidade01/
---
Unidade 01: Que é o computador? 
--- 

<h3>Prácticas da unidade01</h3>

<ul>
 {% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "unidade01" %}
        <ul>
          <li>
             <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </li>
          
        </ul>
   {% endif %}
  {% endfor %}
</ul>


