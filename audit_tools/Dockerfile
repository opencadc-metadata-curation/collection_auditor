ARG OPENCADC_PYTHON_VERSION=3.13
FROM opencadc/astropy:${OPENCADC_PYTHON_VERSION}-slim as builder
ARG OPENCADC_PYTHON_VERSION

RUN apt-get update --no-install-recommends && \
    apt-get install -y build-essential git && \
    rm -rf /var/lib/apt/lists /tmp/* /var/tmp/*

RUN pip install --no-cache-dir polars

ARG OPENCADC_BRANCH=main
ARG OPENCADC_REPO=opencadc

COPY ./docker-entrypoint.sh /usr/local/bin

RUN git clone https://github.com/${OPENCADC_REPO}/cadc-tools.git && \
    cd cadc-tools && \
    git checkout ${OPENCADC_BRANCH} && \
    cp *.py /usr/local/bin

FROM python:${OPENCADC_PYTHON_VERSION}-slim
WORKDIR /usr/src/app
ARG OPENCADC_PYTHON_VERSION

COPY --from=builder /usr/local/lib/python${OPENCADC_PYTHON_VERSION}/site-packages/ /usr/local/lib/python${OPENCADC_PYTHON_VERSION}/site-packages/
COPY --from=builder /usr/local/bin/* /usr/local/bin/

RUN useradd --create-home --shell /bin/bash cadcops
RUN chown -R cadcops:cadcops /usr/src/app
USER cadcops

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

