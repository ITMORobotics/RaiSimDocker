FROM ubuntu:focal

# Timezone Configuration
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#
RUN apt update && apt install -y git \
                                wget \
                                cmake \
                                clang \
                                python3 \
                                python3-dev \
                                python3-pip \
                                python3-distutils \
                                libpython3-dev \
                                libeigen3-dev 
         
RUN apt install -y zsh \
                tmux \
                vim \
                nano

RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y
RUN chsh -s $(which zsh)

# RUN apt install -y \
                # libx11-dev liblapack-dev libv4l-dev libzbar-dev libpthread-stubs0-dev libsdl-dev libsdl-image1.2-dev

# Vulkan Install
RUN apt install -y minizip ffmpeg vulkan vulkan-utils

# RaiSim Install
RUN git clone https://github.com/raisimTech/raisimlib

RUN cd raisimlib \
    && mkdir build \
    && cd build \
    && cmake .. -DCMAKE_INSTALL_PREFIX=/raisim_build -DRAISIM_EXAMPLE=ON -DRAISIM_PY=ON -DPYTHON_EXECUTABLE=$(python3 -c "import sys; print(sys.executable)") \
    && make install -j4

# RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/raisim_build/lib \
#     && export PYTHONPATH=$PYTHONPATH:/raisim_build/lib

RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/raisim_build/lib"  >> ~/.bashrc && \
    echo "export PYTHONPATH=$PYTHONPATH:/raisim_build/lib"  >> ~/.bashrc

# Python package install
RUN pip install numpy scipy matplotlib
