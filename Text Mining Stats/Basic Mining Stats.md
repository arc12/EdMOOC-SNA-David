Basic Forum Stats
========================================================







Qty of forums, threads, posts, comments
-----------


```
## SELECT post_text, post_time from ed_aiplanfor.forum_posts
```

```
## Error: invalid 'row.names' length
```

```
## SELECT count(id) threads, sum(deleted) threads_deleted, sum(is_spam) threads_spam,
##    sum(stickied) threads_stickied, sum(instructor_replied) threads_instructor_replied,
##    sum(anonymous) threads_anonymous, avg(votes) threads_average_votes, 
##    (SELECT count(1) from ed_aiplanfor.forum_tags_threads) threads_tags,
##    (SELECT count(1) from ed_aiplanfor.forum_subscribe_threads) threads_user_subscriptions
##    from ed_aiplanfor.forum_threads
```

```
## SELECT count(id) posts, sum(deleted) posts_deleted, sum(is_spam) posts_spam,
##    sum(stickied) posts_stickied, sum(approved) posts_approved, sum(anonymous) posts_anonymous,
##    avg(votes) posts_average_votes from ed_aiplanfor.forum_posts
```

```
## SELECT count(id) comments, sum(deleted) comments_deleted,
##    sum(is_spam) comments_spam, sum(anonymous) comments_anonymous, avg(votes) comments_average_votes
##    from ed_aiplanfor.forum_comments
```

### Forums


```
## Error: object 'forumCount.df' not found
```


### Threads

|id      | threads | threads_deleted | threads_spam | threads_stickied | threads_instructor_replied | threads_anonymous | threads_average_votes | threads_tags | threads_user_subscriptions |
|:-------|:-------:|:---------------:|:------------:|:----------------:|:--------------------------:|:-----------------:|:---------------------:|:------------:|:--------------------------:|
|aiplan  |   436   |       31        |      1       |         1        |             306            |         64        |        1.2385         |      378     |            1140            |
|astro   |  1727   |       43        |      0       |         0        |              49            |        134        |        3.8471         |     1375     |            9299            |
|crit    |  3091   |       52        |      1       |        16        |             272            |        274        |        0.7554         |     2004     |            8621            |
|edc     |  1452   |       22        |      1       |         2        |             195            |         48        |        0.7424         |     1726     |            7319            |
|equine  |  4865   |       27        |      3       |        18        |            1145            |        186        |        0.3963         |     1081     |           14413            |
|intro   |  3836   |       71        |      3       |        39        |             192            |        242        |        1.3728         |     2941     |           15077            |


This does not count threads in a deleted parent forum as being deleted threads.

### Posts

|id      | posts | posts_deleted | posts_spam | posts_stickied | posts_approved | posts_anonymous | posts_average_votes |
|:-------|:-----:|:-------------:|:----------:|:--------------:|:--------------:|:---------------:|:-------------------:|
|aiplan  |  1846 |       71      |      1     |       0        |       1        |       144       |       0.7893        |
|astro   | 12857 |      374      |     19     |       0        |       0        |       877       |       1.3724        |
|crit    | 11120 |      275      |      4     |       2        |       0        |       779       |       0.5955        |
|edc     |  8943 |      157      |     12     |       0        |       0        |       201       |       0.5186        |
|equine  | 18873 |      233      |     11     |       0        |       0        |       541       |       0.3951        |
|intro   | 20285 |      771      |     23     |       2        |       0        |      1397       |       0.8974        |


This does not count posts in a deleted parent thread as being deleted posts.

### Comments

|id      | comments | comments_deleted | comments_spam | comments_anonymous | comments_average_votes |
|:-------|:--------:|:----------------:|:-------------:|:------------------:|:----------------------:|
|aiplan  |    697   |        58        |       0       |          30        |         0.4046         |
|astro   |   8960   |       417        |      15       |         771        |         0.6184         |
|crit    |   3550   |       220        |       1       |         210        |         0.5406         |
|edc     |   5293   |       195        |       6       |         118        |         0.6148         |
|equine  |   6686   |       129        |       4       |         220        |         0.3035         |
|intro   |  17735   |       915        |      12       |        1616        |         0.6345         |


This does not count comments in a deleted parent posts as being deleted comments.


```
## SELECT post_text, post_time from ed_aiplanfor.forum_posts
```






```
## Error: objects 'accessed.df', 'forumCount.df', 'bushiness.df',
## 'orphans.df', 'forumTopStruct', 'posterRoles.df', 'posterDistS',
## 'posterDistT', 'commenterDistS', 'commenterDistT', 'post_commentDist',
## 'post_commentDist2' not found
```

```
## Saved to Basic Forum Stats.RData 
```

```
## [1] TRUE
```



