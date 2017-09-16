Ruby 2.3.4 using activesupport `Enumerable#sum`
```
ruby-sum-numbers-speed-test  (505)$ be run.rb
       user     system      total        real
reduce  0.630000   0.000000   0.630000 (  0.634850)
inject  0.540000   0.000000   0.540000 (  0.536036)
sum  0.620000   0.000000   0.620000 (  0.619278)
each_plus  0.550000   0.000000   0.550000 (  0.554497)
```

Ruby 2.4.1 with native `sum`
```
ruby-sum-numbers-speed-test  (505)$ be run.rb
       user     system      total        real
reduce  0.630000   0.000000   0.630000 (  0.631974)
inject  0.380000   0.000000   0.380000 (  0.373346)
sum  0.060000   0.000000   0.060000 (  0.062485)
each_plus  0.540000   0.000000   0.540000 (  0.545459)
```


The takeaway?  `inject` is good, but if you use `sum` now (in Rails apps), 
when you upgrade to ruby 2.4.x.,  get a huge improvement when you get to ruby 2.4.1
which you don't get with `reduce` or `inject`.

