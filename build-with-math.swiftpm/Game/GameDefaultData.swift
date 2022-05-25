//
//  GameDefaultData.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

let motivationNotes = [
    "You Can Do It!",
    "Practice Makes Perfect",
    "Winners Never Quit!",
    "Always Move Forward"
]

let monasDetails = StructureInformation(
    structureInitial: "monas",
    structureName: "National Monument",
    structureLocation: "Central Jakarta, Indonesia",
    structureDetails: "The National Monument (Indonesian: Monumen Nasional, abbreviated Monas) is a 132 m (433 ft) obelisk in the center of Merdeka Square, Central Jakarta, symbolizing the fight for Indonesia. \n\nIt is the national monument of the Republic of Indonesia, built to commemorate the struggle for Indonesian independence.",
    // https://id.wikipedia.org/wiki/Monumen_Nasional
    structureSources: "Wikipedia",
    structureSky: Color.skyColor[0]
)

let mtqDetails = StructureInformation(
    structureInitial: "mtq",
    structureName: "Karimun MTQ Monument",
    structureLocation: "Karimun Regency, Indonesia",
    structureDetails: "Karimun MTQ Monument (Indonesian: Tugu MTQ Karimun) is an icon from Karimun Regency. \n\nThe MTQ monument symbolizes one of the 4 Azam driving the Karimun Regency proclaimed by the Karimun Regency Government, namely the Azam for Increasing Faith and Taqwa.",
    
    // https://www.rcmnews.id/tugu-mtq-kabupaten-karimun-semakin-indah/
    // https://cakrawalanusantara.id/2020/10/13/gaji-asn-dan-honorer-pemkab-tanjung-balai-karimun-telat-pegawai-bingung/
    structureSources: "Cakrawala Nusantara & RCMNews",
    structureSky: Color.skyColor[1]
)

let jogjaDetails = StructureInformation(
    structureInitial: "jogja",
    structureName: "Yogyakarta Monument",
    structureLocation: "Yogyakarta, Indonesia",
    structureDetails: "Yogyakarta Monument (Indonesian: Tugu Yogyakarta) is an important historical landmark in the city of Yogyakarta, Indonesia. \n\n This monument is built on 1755 by Sri Sultan Sri Sultan Hamengkubuwono I. It is known as \"Tugu Golong-Gilig\", and was built in the spirit of people's unity.\n\nBecause of its historical background, Yogyakarta Monument has become a historical icon of the city.",
    // https://en.wikipedia.org/wiki/Tugu_Yogyakarta
    structureSources: "Wikipedia",
    structureSky: Color.skyColor[0]
)

let khatulistiwaDetails = StructureInformation(
    structureInitial: "khatulistiwa",
    structureName: "Equator Monument",
    structureLocation: "Pontianak, Indonesia",
    structureDetails: "Equator Monument (Indonesian: Tugu Khatulistiwa) is an iconic monument from Pontianak, Indonesia. \n\nEquator Monument marks the division between northern and southern hemispheres. As the sun’s culmination point occurs, the city of Pontianak attracts tourist arrivals from various places!",
    // https://infopublik.id/kategori/nusantara/304156/tugu-khatulistiwa-pontianak-membelah-bumi-menjadi-dua-bagian
    structureSources: "InfoPublik and Wikipedia",
    structureSky: Color.skyColor[1]
)

let gadangDetails = StructureInformation(
    structureInitial: "gadang",
    structureName: "Jam Gadang",
    structureLocation: "Bukittinggi, Indonesia",
    structureDetails: "Jam Gadang (Minangkabau for \"Big Clock\") is a landmark of Bukittinggi, West Sumatra, Indonesia that is built in 1926 - 1927. \n\nIt is in the center of the city, near the main market, Pasar Ateh. Jam Gadang become one of the tourist attractions in the city of Bukittinggi.\n\nOne of the uniqueness of the Jam Gadang lies in the number four which written with IIII instead of IV in Roman script. The local community believes that the number IIII was made to commemorate the four workers who died due to work accidents.",
    // https://id.wikipedia.org/wiki/Jam_Gadang
    // https://en.wikipedia.org/wiki/Jam_Gadang
    // https://kumparan.com/kumparantravel/5-fakta-menarik-jam-gadang-disebut-mirip-big-ben-hingga-misteri-angka-4-1u7ZwiiNWxw/3
    structureSources: "Wikipedia and Kumparan",
    structureSky: Color.skyColor[1]
)


let mandalaDetails = StructureInformation(
    structureInitial: "mandala",
    structureName: "Mandala Monument",
    structureLocation: "Makassar, Indonesia",
    structureDetails: "Mandala Monument (Indonesian: Monumen Mandala) is a monument that was built in Makassar, Indonesia. \n\nThe purpose of Mandala Monument is to commemorate the services of the heroes during the liberation of West Irian from the Dutch colonialists as well as to appreciate the services of the second former President of the Republic of Indonesia, Soeharto.",
    // https://jurnalsepernas.id/mengenal-monumen-mandala/
    structureSources: "Jurnalsepernas",
    structureSky: Color.skyColor[0]
)

let puputanDetails = StructureInformation(
    structureInitial: "puputan",
    structureName: "Puputan Klungkung",
    structureLocation: "Semarapura, Indonesia",
    structureDetails: "The Puputan Klungkung Monument (Indonesian: Monumen Puputan Klungkung) is a city park equipped with an inscription monument and is located in the heart of Semarapura City, Klungkung Regency, Indonesia. \n\nThis monument is a symbol of the struggle of the people of the Klungkung kingdom against the colonialists who tried to control their territory. ",
    // https://klungkungkab.go.id/halaman/detail/monumen-puputan-klungkung
    structureSources: "Klungkung Government Website",
    structureSky: Color.skyColor[1]
)

let pahlawanDetails = StructureInformation(
    structureInitial: "pahlawan",
    structureName: "Heroes Monument",
    structureLocation: "Surabaya, Indonesia",
    structureDetails: "Heroes Monument (Indonesian: Tugu Pahlawan) is a monument that has become a landmark in the city of Surabaya.\n\nThe body of the monument is in the form of 10 arches (cannelures) and is divided into 11 segments. Height, segment, and cannelures have the meaning of the 10 November 1945. \n\nA historic date, not only for the people of Surabaya, but also for all Indonesian people. Heroes Monument was built to commemorate the events of the Battle of November 10, 1945 in Surabaya, where the Suroboyo arek fought against the Allied forces along with the Dutch who wanted to re-colonize Indonesia.",
    // https://id.wikipedia.org/wiki/Tugu_Pahlawan
    // https://www.djkn.kemenkeu.go.id/kpknl-surabaya/baca-artikel/14389/Tugu-Pahlawan.html
    structureSources: "Wikipedia and Ministry of Finance Website",
    structureSky: Color.skyColor[0]
)
