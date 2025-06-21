## Figure 4

### Figure 4A

Heatmap of TF activity score across two species, the scores were transformed into Zscore

```
sed '1d' j22_results.txt| cut -f 2,6,8 > d.ind.score.txt
```
### Figure 4B
TF motif activity score in testes across two hybrids
```
sed '1d' j22_results.txt|cut -f 2,10,11 > vol.aj22.txt
```
