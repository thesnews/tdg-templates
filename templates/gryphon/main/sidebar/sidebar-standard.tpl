{# gryphon/main/sidebar/sidebar-standard.tpl #}

{% helper request %}

<div class="span4 hidden-phone hidden-tablet">
	<div class="sidebar-wrap pull-right">
		{% include 'gryphon/ads/rectangle.tpl' %}

		<hr class="hairline" />

		{% include 'gryphon/main/radio.tpl' %}

		<hr class="hairline" />

		<header class="box">
		<h3>Classifieds</h3>
		</header>
		<div id="CampusAveAPI_Recent_Listings_Container" partnerid="540" format="large">Loading Recent Classifieds...</div> <script type="text/javascript" src="http://www.campusave.com/includes/api.recent.js"></script>

		<hr class="hairline" />

		{% include 'gryphon/main/popular-box.tpl' %}

		<hr class="spacer" />

		{% include 'tsn/poll/recent.tpl' %}

		<hr class="spacer" />

		<!--
{#<a class="twitter-timeline" href="https://twitter.com/thegamecock" data-widget-id="297051683148668928">Tweets by @thegamecock</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="/
		platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>#}
-->
		<a class="twitter-timeline" href="https://twitter.com/thegamecock" data-widget-id="301725827232563200">Tweets by @thegamecock</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

		<hr class="spacer" />

		<div class="text-center">
				<div class="pull-left">{% include 'gryphon/ads/tower_left.tpl' %}</div>

				<div class="pull-right">{% include 'gryphon/ads/tower_right.tpl' %}</div>
				<div class="clearfix"></div>
		</div>

		<hr class="spacer" />

		{% include 'gryphon/main/recent-box.tpl' %}

		<hr class="spacer" />
		<header class="box"><h3>Email Edition</h3></header>
		<div class="box mb bg">
			
            <h5>Fresh headlines, delivered daily, to your inbox.</h5>
            <a href="http://eepurl.com/BshWT" target="_blank" class = "btn btn-primary">Subscribe</a>
        </div>




	</div>
</div>

