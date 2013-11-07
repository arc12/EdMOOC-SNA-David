Network Tools
========================================================

Load settings file


```r
source("../load_settings.R")
```


This will generate graphml files for everything in forum, at the moment this is based on posts in a thread, bungs them in the output folder, comment this out if you don't want the Gephi files:


```r
# source('network_tools/graphml_generation_tool.R')
```


We can also figure out the top inbetweenness centrality for each poster using the script at:


```r
source("centrality_measures.R")
```

```
## Loading required package: DBI
```

```
## [1] "ed_aiplanfor"
## [1] "ed_astrofor"
## [1] "ed_critfor"
## [1] "ed_equinefor"
## [1] "ed_introfor"
## [1] "ed_edcfor"
## [1] "ed_aiplanfor"
## e99fdd408b9870bcf17419d5e212c0a364a4dbd0 
##                                   5405.4 
## 5a767e2af9d12ec1c09dab9eb98638d9a5f8885d 
##                                   1501.5 
## caeffa1d0ad81d2589ee62973a363fc91bd27561 
##                                   1415.3 
## 52f41bbdb61d3ef65ae98ba58f4b5043c71cd4b2 
##                                   1015.1 
## 476051f0a57b084645139faf96e933cf079d020b 
##                                    858.1 
## b1eacfc2ebdc91f89743e9e7a70b4195e99c6ce5 
##                                    803.3 
## 9ae0f6cfb9e83db30faca2b87203b46995f96654 
##                                    788.5 
## 8d745ed2bf5b5c8db1567caaa522d5c902d19e61 
##                                    683.9 
## 57283da96bbb27a4992e316a24a9a52e4d884ea8 
##                                    590.0 
## 745b06a1658783c9152dcef0d928dce18eff37da 
##                                    456.0 
## 60de574ce280106cf1d364f12da4cc91b2b60404 
##                                    436.8 
## 9d32eb7bed1f9b312878ec4f56c7a30718be5fc4 
##                                    436.2 
## 540e3d24e61c6a6ffaeab718d8ffb0459220b48b 
##                                    413.0 
## 760243d0f259cd3453eda186fb703aa52ed092dc 
##                                    378.1 
## 40bd1dc52753049cf4c081e6b80bbbd6059a7b8c 
##                                    360.3 
## e5c75cba8d9644469d08fbe9366d37aa508c1968 
##                                    348.0 
## 696d365f7468fa615cd11924fe06c00825f93153 
##                                    345.0 
## 99672c4bb7a84d4fe2c6edecf55a671a9d4a3121 
##                                    319.2 
## f8dd082b17cea34b5206a6fa7b3f830dfdd63360 
##                                    319.2 
## 726ad5dcc80f28f3435587a7697b685cd0999e25 
##                                    300.3 
## [1] "ed_astrofor"
## 03c0e6ebff34445193b6c7c68cc59bb951fe8089 
##                                    86204 
## f46d050002d9abf87560899f3af4af9349d775bc 
##                                    69081 
## c730d376fb14523bf01be79ac927050fbc1ebb0f 
##                                    68764 
## a5c77cc395c9feb0ad0e7284687af2e8441bd659 
##                                    68713 
## 57ecaa66b4c47d56d2fa449d06204da2e65c4709 
##                                    65079 
## f59fa5327c4007f70e5d320156435af9bdc24c3c 
##                                    64353 
## f9a98ac1e3bfbe334aa9c14e871bd4dc682b7d8c 
##                                    61983 
## 4dcb05cdf3efb78625f8305ea997bf9c0a93a5a5 
##                                    49188 
## 4e595ee6f98705d6257349dd11f8ce61dbc025dc 
##                                    48257 
## e28b83e67ac394a0989c0849ff4c7d9291934a5f 
##                                    46798 
## c0c2552c387f4386f5a0cbb279df75bee630af98 
##                                    46738 
## ac816c943517abefdc4093b4229cda07ee2beee6 
##                                    43319 
## b744c2359fe2d4c7e3f09bbe6e6747d32ddd8175 
##                                    41906 
## 5bdf4892e5700369c51fea6488778918eb9cd397 
##                                    39872 
## 241865389818c3de230373f985562640bb888323 
##                                    39020 
## b4c39470b526ffa4abe5e2f152d2cacb3e418561 
##                                    38239 
## ab8ea42fa4e7f72628bf6f07e1f87ea975319c9a 
##                                    37753 
## 826b35ae060043ca58e6f4dc7ce4e691ccd1d0d5 
##                                    37484 
## bd59c17b9226cebe95da62a8808ce53a296e7f13 
##                                    33831 
## 655acbc6466541e7963dc8bc4a2e05cf159ea079 
##                                    30957 
## [1] "ed_critfor"
## e6fd6651dc1b0c116f89c27ab98119b83a35399c 
##                                    95111 
## 878c5fbbb632b9d62640addf3276abec2a2df5f2 
##                                    59000 
## cfc1510b5769214a92d4a11c17c12deb7dd9b13b 
##                                    53861 
## e65807e299412ce8a15015974703b083cf5246eb 
##                                    42911 
## e4f640e526ab9e6a25e97e33b8ecf5421ce142fd 
##                                    37523 
## 3d53d24c860cd178fc3fecf3c415b99fbfa50511 
##                                    34042 
## 9d3e26b03d1d18f4b754fc0af0a87c64e8dde563 
##                                    31406 
## c2cafdffe3026680d70e67eeeefb5a1e99f1d857 
##                                    27467 
## cdfe2bbfde737031c1777c7e4fa39d2d2858fdda 
##                                    23919 
## 79461a7d6dc917b1354d7dc5d111c66709b0b699 
##                                    23525 
## 309a07aa2693d34d4db58b57d7715ae197361bdb 
##                                    23198 
## 8410485309a24e9e08c5d11985ff5c227c8b057c 
##                                    22859 
## 1ca44397e253ef795dfed137ce91c2757cc71562 
##                                    21859 
## 288373c1ad59b095c772a3e90122204ea789e3fb 
##                                    20939 
## d0c465a8b80c50fc44ebeac6bf07ae0eba94611c 
##                                    20422 
## 8115fabcc1e87652d48329238e87a66b51761251 
##                                    19081 
## 9ee4aa4f5b19060e847c1ddbdb431d53d63156d6 
##                                    18280 
## f6d6564e72d11b0d83f4281675747017c6a6cfa0 
##                                    18085 
## 60225550b4c8cf050c466019de8750d2e81f8b0c 
##                                    18010 
## 4ba9d9a9a2276919235ea4a36fdeeca96f165db1 
##                                    17666 
## [1] "ed_equinefor"
## 74873787c8a41b0f6503a012bd5730ff09411ac6 
##                                   101207 
## 3563870d026aaf2a175e28e76ea50d943aab04ca 
##                                    86915 
## 28189337c30cf629d3d05ea05613765f6afd1837 
##                                    57120 
## f675799cad241b0b8d21ac985a268221262f208d 
##                                    51272 
## ae3bd3c19dbd508a281411581eb8e493cc7a5260 
##                                    48612 
## 06098328fbcfa25ecb76ce18202817e9f2ff2ee3 
##                                    45218 
## 301363b57f540ad208c0c9b4a52ba06b688d8d60 
##                                    37229 
## afa7a2f390fa35a4ec0d46f85f48b423bde0b9e1 
##                                    33811 
## 259f4b732bffcbacfdf407c59662e3c696564953 
##                                    33731 
## 61eb92948ec1616bc3496132b045ed984c70c9a4 
##                                    30310 
## 52444afc380d55a774ff330e573bbf9efbc57f7f 
##                                    29983 
## 9c1a3dad1d71b1531ec129a5cac5b1006af771d1 
##                                    29473 
## 3ef0532c0cd7027e37828f44187c502ed5438324 
##                                    29110 
## 812c77b74b0ab201d31bf51ffb58de0dde9ba893 
##                                    27915 
## 7aea6002147ed534fcb9530eb38b024c11a74a9b 
##                                    27697 
## e224e14efef1ad355cb48e93a64d974dc5464b5d 
##                                    25030 
## 158261eb3f2effda6e46833ed6655e0988e58ae6 
##                                    24682 
## 3aef7e42e920b22a2c02399e22ee050a95a5be71 
##                                    24647 
## 18a0615c7e065d1079682d77e6b80621dcdf5fd4 
##                                    24524 
## e53df92e9d85c1ef4c6d58babd3903db0bf898a3 
##                                    23791 
## [1] "ed_introfor"
## 6cf62e6072fa139e6d5637f947e26a9a30558a5f 
##                                   308031 
## 7ff5a840a86fefb92fc6c3d2c79fe2502e927adb 
##                                   267193 
## e54243193928805247c7ae2fcf7f40c46a06fbaf 
##                                   166946 
## 06099a45eeaa36f4f6e2267392b1b8d65822dcbb 
##                                   163249 
## 6b3fc80186777fe1e01efcd3f14fb310bc5b8aea 
##                                   155529 
## b0cdcf315f19b8fd24a6ba557516289eb93bcf8a 
##                                   147133 
## 56512fff97729a89bbf4b752937bae1e66cc1405 
##                                   128230 
## 9f96959fd778d67f9819774d98fdd7471631225b 
##                                   121371 
## f2bfa78173941c329a1d8b11a123c3a9ab1f8eee 
##                                    96805 
## c6f38631f45d07ae5d943b3e949924d12346a5cc 
##                                    93588 
## d3ba23ec2a7d607e7c02706547bd5779d91dab38 
##                                    93345 
## e477f94d188d69dae3bbcf2648910e4c97196d81 
##                                    92524 
## 20ae763e6631792c33ecca510c75c41bed0d7a47 
##                                    85014 
## a3e084fe6917095335b07e11e26ae9230d4dfa9f 
##                                    84592 
## db61f7a5e00e6a44ee0a9bd09cdfbafe9ac56a75 
##                                    83391 
## 51921a075b8169a4f7422f4b52ca449a94e6562a 
##                                    80414 
## 8a41da2358bd108145da57c11e5c1d590ab4a04f 
##                                    78354 
## adb2104bd06cc22eb7ccb7fcd71b46f10209609c 
##                                    77728 
## dc74dade99090e90a5a78153d4af0eb402288115 
##                                    69092 
## 1013a2e0fb277b66525f25019cbbbcbc65be0f99 
##                                    67873 
## [1] "ed_edcfor"
## b334d2db581d0796f810b600c5b440c08eabbfaa 
##                                    40797 
## a042cc712da71d1aa7dd0ab982cab60b67d2d810 
##                                    39236 
## 96178f7f342598dc15d13177f2cd9c64aa8aa3a0 
##                                    35408 
## c331bd156880c89dba211067ec3e7f1043e6618a 
##                                    34927 
## d2b5fe929ec47215f403406a2cea01ec59edff64 
##                                    32174 
## 15c039d6943c5d650efc1e66cce1adf04565f288 
##                                    28311 
## 61e4005f350612016961644883a8b13bf7c73ca7 
##                                    26338 
## 3c19ebffface37c4a00bea89577ee62bd195fa59 
##                                    23628 
## 5afc1c334350447ab403f89cd4184fd7b3a799a1 
##                                    23461 
## 43acb4c2fe70c777661ea91bb6a497d41b71d4df 
##                                    21681 
## 3f6e055ec38b09da1fcb8eb9147b67be5f2c26c0 
##                                    21114 
## dcfafd3cd92a93c8969bd49c822d005e5a0d5d6a 
##                                    20962 
## c1cc62bcfb7fcf3247979d7308d131b3e4515618 
##                                    20258 
## 371daf9b1c029c30b287c3abb6b2ca659a3c1e55 
##                                    20211 
## a3f764df4c7ad5b8f4c3ab82cc6b2386c15606d5 
##                                    19705 
## 4f051ddf8c0f4999ea968fd905b1a2edf0ac60d3 
##                                    18707 
## ae17ba7f4e3aab615e5d7b6143d4b984aad96b34 
##                                    18200 
## 3312158445e7c4cfd27807ca5c070c6ee2da8bbf 
##                                    17604 
## c42f3da729cafa13f28898def99b873893a8bee5 
##                                    17540 
## 792d329ccdbe1f10fd0e248cee7466edd9a18582 
##                                    17434
```


We can see the anon id of the top betweeness centrality for each forum: 


```r

for (i in settings.databases[, 1]) {
    print(i)
    print(top_bm[[i]])
}
```

```
## [1] "ed_aiplanfor"
## e99fdd408b9870bcf17419d5e212c0a364a4dbd0 
##                                   5405.4 
## 5a767e2af9d12ec1c09dab9eb98638d9a5f8885d 
##                                   1501.5 
## caeffa1d0ad81d2589ee62973a363fc91bd27561 
##                                   1415.3 
## 52f41bbdb61d3ef65ae98ba58f4b5043c71cd4b2 
##                                   1015.1 
## 476051f0a57b084645139faf96e933cf079d020b 
##                                    858.1 
## b1eacfc2ebdc91f89743e9e7a70b4195e99c6ce5 
##                                    803.3 
## 9ae0f6cfb9e83db30faca2b87203b46995f96654 
##                                    788.5 
## 8d745ed2bf5b5c8db1567caaa522d5c902d19e61 
##                                    683.9 
## 57283da96bbb27a4992e316a24a9a52e4d884ea8 
##                                    590.0 
## 745b06a1658783c9152dcef0d928dce18eff37da 
##                                    456.0 
## 60de574ce280106cf1d364f12da4cc91b2b60404 
##                                    436.8 
## 9d32eb7bed1f9b312878ec4f56c7a30718be5fc4 
##                                    436.2 
## 540e3d24e61c6a6ffaeab718d8ffb0459220b48b 
##                                    413.0 
## 760243d0f259cd3453eda186fb703aa52ed092dc 
##                                    378.1 
## 40bd1dc52753049cf4c081e6b80bbbd6059a7b8c 
##                                    360.3 
## e5c75cba8d9644469d08fbe9366d37aa508c1968 
##                                    348.0 
## 696d365f7468fa615cd11924fe06c00825f93153 
##                                    345.0 
## 99672c4bb7a84d4fe2c6edecf55a671a9d4a3121 
##                                    319.2 
## f8dd082b17cea34b5206a6fa7b3f830dfdd63360 
##                                    319.2 
## 726ad5dcc80f28f3435587a7697b685cd0999e25 
##                                    300.3 
## [1] "ed_astrofor"
## 03c0e6ebff34445193b6c7c68cc59bb951fe8089 
##                                    86204 
## f46d050002d9abf87560899f3af4af9349d775bc 
##                                    69081 
## c730d376fb14523bf01be79ac927050fbc1ebb0f 
##                                    68764 
## a5c77cc395c9feb0ad0e7284687af2e8441bd659 
##                                    68713 
## 57ecaa66b4c47d56d2fa449d06204da2e65c4709 
##                                    65079 
## f59fa5327c4007f70e5d320156435af9bdc24c3c 
##                                    64353 
## f9a98ac1e3bfbe334aa9c14e871bd4dc682b7d8c 
##                                    61983 
## 4dcb05cdf3efb78625f8305ea997bf9c0a93a5a5 
##                                    49188 
## 4e595ee6f98705d6257349dd11f8ce61dbc025dc 
##                                    48257 
## e28b83e67ac394a0989c0849ff4c7d9291934a5f 
##                                    46798 
## c0c2552c387f4386f5a0cbb279df75bee630af98 
##                                    46738 
## ac816c943517abefdc4093b4229cda07ee2beee6 
##                                    43319 
## b744c2359fe2d4c7e3f09bbe6e6747d32ddd8175 
##                                    41906 
## 5bdf4892e5700369c51fea6488778918eb9cd397 
##                                    39872 
## 241865389818c3de230373f985562640bb888323 
##                                    39020 
## b4c39470b526ffa4abe5e2f152d2cacb3e418561 
##                                    38239 
## ab8ea42fa4e7f72628bf6f07e1f87ea975319c9a 
##                                    37753 
## 826b35ae060043ca58e6f4dc7ce4e691ccd1d0d5 
##                                    37484 
## bd59c17b9226cebe95da62a8808ce53a296e7f13 
##                                    33831 
## 655acbc6466541e7963dc8bc4a2e05cf159ea079 
##                                    30957 
## [1] "ed_critfor"
## e6fd6651dc1b0c116f89c27ab98119b83a35399c 
##                                    95111 
## 878c5fbbb632b9d62640addf3276abec2a2df5f2 
##                                    59000 
## cfc1510b5769214a92d4a11c17c12deb7dd9b13b 
##                                    53861 
## e65807e299412ce8a15015974703b083cf5246eb 
##                                    42911 
## e4f640e526ab9e6a25e97e33b8ecf5421ce142fd 
##                                    37523 
## 3d53d24c860cd178fc3fecf3c415b99fbfa50511 
##                                    34042 
## 9d3e26b03d1d18f4b754fc0af0a87c64e8dde563 
##                                    31406 
## c2cafdffe3026680d70e67eeeefb5a1e99f1d857 
##                                    27467 
## cdfe2bbfde737031c1777c7e4fa39d2d2858fdda 
##                                    23919 
## 79461a7d6dc917b1354d7dc5d111c66709b0b699 
##                                    23525 
## 309a07aa2693d34d4db58b57d7715ae197361bdb 
##                                    23198 
## 8410485309a24e9e08c5d11985ff5c227c8b057c 
##                                    22859 
## 1ca44397e253ef795dfed137ce91c2757cc71562 
##                                    21859 
## 288373c1ad59b095c772a3e90122204ea789e3fb 
##                                    20939 
## d0c465a8b80c50fc44ebeac6bf07ae0eba94611c 
##                                    20422 
## 8115fabcc1e87652d48329238e87a66b51761251 
##                                    19081 
## 9ee4aa4f5b19060e847c1ddbdb431d53d63156d6 
##                                    18280 
## f6d6564e72d11b0d83f4281675747017c6a6cfa0 
##                                    18085 
## 60225550b4c8cf050c466019de8750d2e81f8b0c 
##                                    18010 
## 4ba9d9a9a2276919235ea4a36fdeeca96f165db1 
##                                    17666 
## [1] "ed_equinefor"
## 74873787c8a41b0f6503a012bd5730ff09411ac6 
##                                   101207 
## 3563870d026aaf2a175e28e76ea50d943aab04ca 
##                                    86915 
## 28189337c30cf629d3d05ea05613765f6afd1837 
##                                    57120 
## f675799cad241b0b8d21ac985a268221262f208d 
##                                    51272 
## ae3bd3c19dbd508a281411581eb8e493cc7a5260 
##                                    48612 
## 06098328fbcfa25ecb76ce18202817e9f2ff2ee3 
##                                    45218 
## 301363b57f540ad208c0c9b4a52ba06b688d8d60 
##                                    37229 
## afa7a2f390fa35a4ec0d46f85f48b423bde0b9e1 
##                                    33811 
## 259f4b732bffcbacfdf407c59662e3c696564953 
##                                    33731 
## 61eb92948ec1616bc3496132b045ed984c70c9a4 
##                                    30310 
## 52444afc380d55a774ff330e573bbf9efbc57f7f 
##                                    29983 
## 9c1a3dad1d71b1531ec129a5cac5b1006af771d1 
##                                    29473 
## 3ef0532c0cd7027e37828f44187c502ed5438324 
##                                    29110 
## 812c77b74b0ab201d31bf51ffb58de0dde9ba893 
##                                    27915 
## 7aea6002147ed534fcb9530eb38b024c11a74a9b 
##                                    27697 
## e224e14efef1ad355cb48e93a64d974dc5464b5d 
##                                    25030 
## 158261eb3f2effda6e46833ed6655e0988e58ae6 
##                                    24682 
## 3aef7e42e920b22a2c02399e22ee050a95a5be71 
##                                    24647 
## 18a0615c7e065d1079682d77e6b80621dcdf5fd4 
##                                    24524 
## e53df92e9d85c1ef4c6d58babd3903db0bf898a3 
##                                    23791 
## [1] "ed_introfor"
## 6cf62e6072fa139e6d5637f947e26a9a30558a5f 
##                                   308031 
## 7ff5a840a86fefb92fc6c3d2c79fe2502e927adb 
##                                   267193 
## e54243193928805247c7ae2fcf7f40c46a06fbaf 
##                                   166946 
## 06099a45eeaa36f4f6e2267392b1b8d65822dcbb 
##                                   163249 
## 6b3fc80186777fe1e01efcd3f14fb310bc5b8aea 
##                                   155529 
## b0cdcf315f19b8fd24a6ba557516289eb93bcf8a 
##                                   147133 
## 56512fff97729a89bbf4b752937bae1e66cc1405 
##                                   128230 
## 9f96959fd778d67f9819774d98fdd7471631225b 
##                                   121371 
## f2bfa78173941c329a1d8b11a123c3a9ab1f8eee 
##                                    96805 
## c6f38631f45d07ae5d943b3e949924d12346a5cc 
##                                    93588 
## d3ba23ec2a7d607e7c02706547bd5779d91dab38 
##                                    93345 
## e477f94d188d69dae3bbcf2648910e4c97196d81 
##                                    92524 
## 20ae763e6631792c33ecca510c75c41bed0d7a47 
##                                    85014 
## a3e084fe6917095335b07e11e26ae9230d4dfa9f 
##                                    84592 
## db61f7a5e00e6a44ee0a9bd09cdfbafe9ac56a75 
##                                    83391 
## 51921a075b8169a4f7422f4b52ca449a94e6562a 
##                                    80414 
## 8a41da2358bd108145da57c11e5c1d590ab4a04f 
##                                    78354 
## adb2104bd06cc22eb7ccb7fcd71b46f10209609c 
##                                    77728 
## dc74dade99090e90a5a78153d4af0eb402288115 
##                                    69092 
## 1013a2e0fb277b66525f25019cbbbcbc65be0f99 
##                                    67873 
## [1] "ed_edcfor"
## b334d2db581d0796f810b600c5b440c08eabbfaa 
##                                    40797 
## a042cc712da71d1aa7dd0ab982cab60b67d2d810 
##                                    39236 
## 96178f7f342598dc15d13177f2cd9c64aa8aa3a0 
##                                    35408 
## c331bd156880c89dba211067ec3e7f1043e6618a 
##                                    34927 
## d2b5fe929ec47215f403406a2cea01ec59edff64 
##                                    32174 
## 15c039d6943c5d650efc1e66cce1adf04565f288 
##                                    28311 
## 61e4005f350612016961644883a8b13bf7c73ca7 
##                                    26338 
## 3c19ebffface37c4a00bea89577ee62bd195fa59 
##                                    23628 
## 5afc1c334350447ab403f89cd4184fd7b3a799a1 
##                                    23461 
## 43acb4c2fe70c777661ea91bb6a497d41b71d4df 
##                                    21681 
## 3f6e055ec38b09da1fcb8eb9147b67be5f2c26c0 
##                                    21114 
## dcfafd3cd92a93c8969bd49c822d005e5a0d5d6a 
##                                    20962 
## c1cc62bcfb7fcf3247979d7308d131b3e4515618 
##                                    20258 
## 371daf9b1c029c30b287c3abb6b2ca659a3c1e55 
##                                    20211 
## a3f764df4c7ad5b8f4c3ab82cc6b2386c15606d5 
##                                    19705 
## 4f051ddf8c0f4999ea968fd905b1a2edf0ac60d3 
##                                    18707 
## ae17ba7f4e3aab615e5d7b6143d4b984aad96b34 
##                                    18200 
## 3312158445e7c4cfd27807ca5c070c6ee2da8bbf 
##                                    17604 
## c42f3da729cafa13f28898def99b873893a8bee5 
##                                    17540 
## 792d329ccdbe1f10fd0e248cee7466edd9a18582 
##                                    17434
```


Let's find out who they are:
