---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---


<h2> Listado de unidades  </h2>
<div class="tags-expo">
  <div class="tags-expo-list">
  <ul>
    {% for cat in site.categories %}
        <li> <a href="{{ cat[0] | slugify }}" class="post-tag">{{ cat[0] | capitalize}} </a>  : [{{ cat[1].size }}]</li>


    {% endfor %}
    </ul>
  </div>

  </div>
