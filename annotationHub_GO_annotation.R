library(AnnotationHub)
ah <- AnnotationHub()
ch <- query(ah, "Colletotrichum higginsianum")
ch
ch_17 <- ah[["AH73270"]]
columns(ch_17)
keytypes(ch_17)
select(vd_17, keys="基因名", columns = c("ACCNUM", "ALIAS", "ENTREZID", "GENENAME",
                                      "GID", "GO", "PMID", "SYMBOL"), keytype = "SYMBOL")

# pro <- read.csv("protein2go.csv")#XP_009647991.1
# 加载蛋白或基因名
pro_id <- as.character(pro$query_name)

map1 <- select(ch_17, keys=pro_id, columns = c("SYMBOL", "GO","GOALL", "ONTOLOGY", "ONTOLOGYALL",
                                               "EVIDENCEALL", "EVIDENCE", "ENTREZID"), keytype = "ACCNUM")
write.table(map1, file="ch_annotated.txt", row.name=FALSE, col.names=TRUE,quote=FALSE)