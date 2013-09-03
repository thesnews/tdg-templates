{# gryphon/page/templates/contact.tpl#}

{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}
{% block description %}{{ page.content_formatted|striptags|clip(400) }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block styles %}

{% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}

<div class="row page">
    <div class="span8">

        <h1>Contact us</h1>

        <hr class="hairline" />

        <h2>By E-mail:</h2>

        <hr class="spacer" />

        {{ page.content }}
        <hr class="spacer" />

        <h2>By Phone:</h2>

        <hr class="spacer" />

        <strong>Advertising:</strong> 803-777-3888<br />
        <strong>Newsroom:</strong> 803-777-7726<br />
        <strong>Sports:</strong> 803-777-7182<br />
        <strong>Editor's Office:</strong> 803-777-3914<br />
        <strong>Fax:</strong> 803-777-6482

        <hr class="spacer" />

        <h2>For Classified Ads</h2>

        <hr class="spacer" />

        <p><a href="{{ 'classified'|url }}">Place a classified</a> add online.</p>

        <hr class="spacer" />

        <h2>Send packages and press kits to:</h2>

        <hr class="spacer" />

        The Daily Gamecock<br />
        1400 Greene St.<br />
        Columbia, SC 29208
    </div>

    {% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div>


{% endblock content %}
