# Sandbox for Testing Ordinal (Recursive) Inscriptions in Your Browser


The idea is to cache all inscription content to test in `/content`
with the filename matching the inscription id ... now that lets
you test all (recursive) inscriptions in  your browser as is (that is, without any change in the source).


Example 1 - Recursive Punk:

``` svg
<svg width="24px" height="24px" xmlns="http://www.w3.org/2000/svg">
  <image href="/content/7fbfed7e38bbcaf851c2c4426b4c4ede9d09b6e6fd87a040403852681c7c19c2i0" />
  <image href="/content/128d1e42f85e67d2a6b0c4c78e9ad47f7d66ed7699e77ddd0a4f0b8a21cdf736i0" />
  <image href="/content/62ec589582651e49ed722241dab3bdb93fbd8ddf3fab3d891a30165126dddbcfi0" />
  <image href="/content/b866e8f3f51c385a3ae27e65c5abe68e6086a6b74935b1b692de8587f5858148i0" />
</svg>
```

=>  ![](https://ordtest.github.io/content/recursivepunk0.svg)


Example 2 - D.I.Y. Punk:

``` svg
<svg width="24px" height="24px" xmlns="http://www.w3.org/2000/svg">
   <svg viewBox="0 0 24 24">
      <image width="240px" height="144px" href="/content/cf5df319bbe23fa3d012e5ee0810700c8e82aebff41164246f0d87d7b60a9903i0" />
    </svg>
</svg>
```

=> ![](https://ordtest.github.io/content/diypunk0.svg)




## Questions? Comments?

Post them over at the [Help & Support](https://github.com/geraldb/help) page. Thanks.




