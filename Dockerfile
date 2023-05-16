FROM amigadev/crosstools:ppc-amigaos

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
