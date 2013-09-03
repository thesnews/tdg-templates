{# gryphon/page/templates/advertise.tpl #}

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

		<h2>The Daily Gamecock is the best way to reach the 35,000+ University of South Carolina Community</h2>

		<hr class="double spacer" />

        <div class="row-fluid">

            <div class="span8">
                {{ page.content }}
            </div>
            <div class="span4">
                <h4>General Information</h4>

                <hr class="spacer" />

                <small>
                    <ul class="item-list">
                        <li>Main Office: 803-777-3888</li>
                        <li>Display Ads: 803-777-3018</li>
                        <li>Newsroom: 803-777-7726</li>
                        <li>Web: <a href="http://sa.sc.edu/studentmedia">sa.sc.edu/studentmedia</a></li>
                        <li>Creative: <a href="mailto:smcreativeservices@sc.edu">smcreativeservices@sc.edu</a></li>
                        <li>Advertising: <a href="mailto:smadsales@sc.edu">smadsales@sc.edu</a></li>
                        <li>Classifieds: <a href="mailto:saclassi@mailbox.sc.edu">saclassi@mailbox.sc.edu</a></li>
                        <li>
                            <hr class="spacer" />
                            Student Media<br>
                            1400 Greene Street<br>
                            Russell House 343<br>
                            Columbia, SC 29208
                        </li>
                    </ul>
                </small>

                <hr class="hairline" />

                <h4>More Information</h4>

                <hr class="spacer" />

                <small>
                    <ul>
                        <li><a href="http://media.tdg.s3.amazonaws.com/1379_1314mediakitprinto.pdf">Print advertising</a></li>
                        <li><a href="http://media.tdg.s3.amazonaws.com/1380_1314mediakitwebsiteo.pdf">Dailygamecock.com</a></li>
                        <li><a href="http://media.tdg.s3.amazonaws.com/1381_1314mediakitmobileo.pdf">Mobile</a></li>
                        <li><a href="http://media.tdg.s3.amazonaws.com/1384_1314mediakitsocialmediao.pdf">Social Media management</a></li>
                        <li><a href="http://media.tdg.s3.amazonaws.com/1385_1314mediakitpubschedo.pdf">Publication Schedule</a></li>
                        <li><a href="{{ 'assets/dist/files/AdvertisingPolicies.pdf'|asset }}">Policies</a></li>
                        <li><a href="http://media.tdg.s3.amazonaws.com/1382_1314mediakitgabo.pdf">Garnet and Black</a></li>
                        <li><a href="http://media.tdg.s3.amazonaws.com/1383_1314mediakitwusco.pdf">WUSC</a></li>
                        <li><a href="http://media.tdg.s3.amazonaws.com/1378_1314mediakito.pdf">Full Media Kit</a></li>
                    </ul>
                </small>

            </div>
        </div>


	</div>

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div>


{% endblock content %}
