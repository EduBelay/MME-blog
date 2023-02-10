---
layout: page
title: Tablets
permalink: tablets
nav_order: 92
parent: Taller

---
Tablets: 

--- 


# Tablets:

<ul>
 {% assign entradas = site.posts | sort: 'date' %}
  {% for post in entradas %}
   {% if post.categories contains "tablet" %}
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
