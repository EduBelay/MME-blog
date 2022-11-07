---
layout: page
title: Móbiles
permalink: /taller/mobil
nav_order: 91
parent: Taller

---
Móbiles:
--- 

1. Nokia 6700 Classic
2. Nokia Lumia 530 (RM-1017) 


# Mobiles:

<ul>
 {% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "mobil" %}
        <ul>
          <li>
             <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </li>
          
        </ul>
   {% endif %}
  {% endfor %}
</ul>

# Webs de axuda
* [Guias de reparacion de Impextrom](https://nadiemellamagallina.com/)
