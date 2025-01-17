FROM eoelab.org:1027/eoeair/cenv:python

EXPOSE 8000

WORKDIR /opt

RUN pip install jupyterlite-core jupyterlite-pyodide-kernel && pip cache purge && \
    jupyter lite build

ENTRYPOINT [ "jupyter" ]
CMD [ "lite", "serve" ]