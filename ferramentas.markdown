---
layout: page
title: Ferramentas
permalink: ferramentas
nav_order: 93
parent: Taller

---
Ferramentas: 

--- 


# Ferramentas:

<ul>
 {% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "ferramentas" %}
        <ul>
          <li>
             <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </li>
          
        </ul>
   {% endif %}
  {% endfor %}
</ul>
