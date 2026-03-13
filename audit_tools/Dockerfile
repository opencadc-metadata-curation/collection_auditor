ARG OPENCADC_PYTHON_VERSION=3.13
FROM opencadc/astropy:${OPENCADC_PYTHON_VERSION}-slim AS builder
ARG OPENCADC_PYTHON_VERSION

RUN apt-get update --no-install-recommends && \
    apt-get install -y build-essential git && \
    rm -rf /var/lib/apt/lists /tmp/* /var/tmp/*

RUN pip install --no-cache-dir requests polars

ARG OPENCADC_BRANCH=main
ARG OPENCADC_REPO=opencadc-metadata-curation

COPY ./docker-entrypoint.sh /usr/local/bin/

RUN git clone https://github.com/${OPENCADC_REPO}/collection_auditor.git && \
    cd collection_auditor && \
    git checkout ${OPENCADC_BRANCH} && \
    cd audit_tools && \
    cp *.py /usr/local/bin && \
    mkdir /usr/local/.config && \
    cp config/* /usr/local/.config

FROM python:${OPENCADC_PYTHON_VERSION}-slim
WORKDIR /app
ARG OPENCADC_PYTHON_VERSION

COPY --from=builder /usr/local/lib/python${OPENCADC_PYTHON_VERSION}/site-packages/ /usr/local/lib/python${OPENCADC_PYTHON_VERSION}/site-packages/
COPY --from=builder /usr/local/bin/* /usr/local/bin/
COPY --from=builder /usr/local/.config/* /usr/local/.config/

RUN useradd --create-home --shell /bin/bash cadcops
RUN chown -R cadcops:cadcops /app
USER cadcops

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
