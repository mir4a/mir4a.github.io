---
---

$ ->
  commentInit = (e) ->
    $(e.target).fadeOut()
    e.preventDefault()
    window.location.hash = e.target.hash
    window.disqus_shortname = 'mir4a'
    dsq = document.createElement('script')
    dsq.type = 'text/javascript'
    dsq.async = true
    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js'
    document.getElementsByTagName('body')[0].appendChild(dsq)

  $commentWrap = $('#disqus_thread')
  if !!$commentWrap.length
    window.disqus_identifier = $commentWrap.data('disqus-identifier')
    $commentWrap.one 'click', '.show_comments', commentInit
