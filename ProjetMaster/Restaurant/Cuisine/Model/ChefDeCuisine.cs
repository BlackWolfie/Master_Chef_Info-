﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Threading.Tasks;

namespace Cuisine 
{
    class ChefDeCuisine : WORKERS
    {
        private static Thread _thEcoute;

        public void Thread()
        {
            //Préparation et démarrage du thread en charge d'écouter.
            _thEcoute = new Thread(new ThreadStart(Ecouter));
            _thEcoute.Start();
        }

        private static void Ecouter()
        {
            //Console.WriteLine("Préparation à l'écoute...");

            //On crée le serveur en lui spécifiant le port sur lequel il devra écouter.
            UdpClient serveur = new UdpClient(5035);
            //creation liste de commande par table
            List<string> commande = new List<string>();

            //Création d'une boucle infinie qui aura pour tâche d'écouter.
            while (true)
            {
                //Création d'un objet IPEndPoint qui recevra les données du Socket distant.
                IPEndPoint client = null;
                //Console.WriteLine("ÉCOUTE...");

                //On écoute jusqu'à recevoir un message.
                byte[] data = serveur.Receive(ref client);
                //Console.WriteLine("Données reçues en provenance de {0}:{1}.", client.Address, client.Port);

                //Décryptage et affichage du message.
                string message = Encoding.Default.GetString(data);
                //Console.WriteLine("CONTENU DU MESSAGE : {0}\n", message);
                commande.Add(message);

                int i = 0;
                string Table = commande[0];
                


                foreach(string element in commande)
                {
                    switch (i)
                    {
                        case 1:
                            ChefDePartie.preparerEntree(element);
                            break;
                        case 2:
                            ChefDePartie.preparerPlat(element);
                            break;
                        case 3:
                            ChefDePartie.preparerDessert(element);
                            break;
                    }

                    i++;
                }
            }
        }
        public void ReceptionCommande(Message MSG)
        {
            //Recuperer Plat entrée et dessert 
            using (var db = new ConnexionBDD()) {
                string[] tab = new string[] { "Entrée", "Plat", "Dessert" };
                RECETTE entree = new RECETTE();
                
                var entreeRecette = db.RECETTE
                                      .Where(b => b.NOM_RECETTE == tab[0]);

                Console.Write(entreeRecette);
                    
            }

        }

        public void AttribuerTravail()
        {

        }
        
    }
}
