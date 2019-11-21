library(biomaRt)
listMarts(host = 'fungi.ensembl.org')
list_dataset <- listDatasets(useMart('fungi_mart', host = 'fungi.ensembl.org'))
# 在list_dataset中找到研究物种的数据库
list_attribute <- listAttributes(useDataset(dataset = '研究物种', 
                                            mart = useMart('fungi_mart',
                                                           host = 'fungi.ensembl.org')))
list_filter <- listFilters(useDataset(data = '研究物种',
                                      mart = useMart('fungi_mart',
                                                     host = 'fungi.ensembl.org')))
mart <- useMart(biomart = 'fungi_mart', host = 'fungi.ensembl.org',
                dataset = '研究物种')
results <- getBM(attributes = c('ensembl_gene_id', 'go_id', 
                                'name_1006', 'definition_1006', 'namespace_1003'),
                 filter = 'ensembl_gene_id', values = df$geneid,
                 mart = mart)