from ubuntu

COPY . /root/.dotfiles

WORKDIR /root

RUN cd /root/.dotfiles && /root/.dotfiles/install.sh

CMD bash
