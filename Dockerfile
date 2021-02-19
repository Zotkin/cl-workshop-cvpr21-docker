FROM pytorch/pytorch:latest
RUN apt-get update && apt-get install -y git zsh nano xvfb freeglut3-dev pkg-config libfontconfig1-dev
# moved this up so it doesn't rerun on every build
RUN pip install git+https://www.github.com/lebrice/Sequoia.git@cvpr_competition_dev#egg=sequoia[monsterkong]
WORKDIR /app
COPY . .
# just making sure we got everything
RUN pip install -r requirements.txt
CMD xvfb-run --server-args="-screen 0 800x600x24+32" python ./main.py --mode sl


# to build: docker build -t sequoia-seed .
# to run locally: docker run -it --rm sequoia-seed