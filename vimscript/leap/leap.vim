"
" This function takes a year and returns 1 if it's a leap year
" and 0 otherwise.
"
function! IsLeap(number) abort
  if(a:number % 4 == 0 && (a:number % 100 != 0 || a:number % 400 == 0))
    return 1
  end
  return 0
endfunction
