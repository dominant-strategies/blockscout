FROM blockscout/blockscout

COPY _quai_variables.scss apps/block_scout_web/assets/css/theme/_quai_variables.scss
RUN sed -i "s/neutral_variables/quai_variables/g" apps/block_scout_web/assets/css/theme/_variables.scss
RUN sed -i 's/msgid "Ether"/msgid "Quai"/g' apps/block_scout_web/priv/gettext/en/LC_MESSAGES/default.po 
RUN sed -i 's/msgid "Ether"/msgid "Quai"/g' apps/block_scout_web/priv/gettext/default.pot
COPY _footer.html.eex apps/block_scout_web/lib/block_scout_web/templates/layout/_footer.html.eex
COPY quai_logo.png apps/block_scout_web/assets/static/images/quai_logo.png
RUN cd apps/block_scout_web/assets && npm run-script deploy 

RUN cd /opt/app
RUN mix phx.digest

EXPOSE 4000
