---
layout: page
title: Móbiles
permalink: /taller/mobil
nav_order: 91
parent: Taller

---
Móbiles:
--- 


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
* [iFixit](https://es.ifixit.com/Search?doctype=guide)
* [Sosav](https://www.sosav.com/es/guias)
