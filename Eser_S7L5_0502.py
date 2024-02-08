import pandas as pd
import numpy as np 
import matplotlib.pyplot as plt
import seaborn as sns


file_name="./dataset_climatico.csv"
df=pd.read_csv(file_name)

#Normalizzazione dei dati
#Pulire i dati per rimuovere eventuali valori mancanti o errati.
df.dropna(inplace=True)
# Normalizzazione Z-score:Z=(x-mi)/std
colonne_da_normalizzare=["temperatura_media","precipitazioni","umidita","velocita_vento"]
mean=df[colonne_da_normalizzare].mean()
std=df[colonne_da_normalizzare].std()
df[colonne_da_normalizzare]=(df[colonne_da_normalizzare]-mean)/std
#print(df)
#Analisi Esplorativa dei dati.
#Calcolare statistiche descrittive (media, mediana, deviazione standard) per ogni variabile.
statistiche_descrittive=df.describe()
print(statistiche_descrittive)

# Creare grafici (istogrammi, box plots) per visualizzare la distribuzione 
# di ciascuna variabile normalizzata.

# Crea un istogramma per ogni colonna
for colonna in colonne_da_normalizzare:
    plt.figure(figsize=(10, 4))

    # Istogramma
    plt.subplot(1, 2, 1)
    sns.histplot(df[colonna], bins=30, kde=True)
    plt.title('Istogramma di ' + colonna)

    # Box plot
    plt.subplot(1, 2, 2)
    sns.boxplot(x=df[colonna])
    plt.title('Box plot di ' + colonna)

    plt.show()

    
#Analisi di Correlazione:
#Utilizzare una heatmap per visualizzare la correlazione tra le diverse
# variabili meteorologiche.
corr=df["temperatura_media"].corr(other=df["umidita"])
print("La correelazione è: ",corr)


matrice_correlazione = df[colonne_da_normalizzare].corr()
plt.figure(figsize=(10, 8))
sns.heatmap(matrice_correlazione, annot=True, cmap='coolwarm', linewidths=.5)
plt.title('Matrice di Correlazione tra Variabili Meteorologiche')
plt.show()



# Creazione di un grafico di regressione lineare con correlazione annotata
plt.figure(figsize=(8, 6))
sns.regplot(x="temperatura_media", y="precipitazioni", data=df)
plt.title('Grafico di Regressione tra Temperatura Media e Precipitazioni')
plt.xlabel('Temperatura Media')
plt.ylabel('Precipitazioni')
plt.show()
