#
#
#

complete --command my_memory_mem --erase

complete --command my_memory_mem \
  --no-files
complete --command my_memory_mem \
  --short s --long short \
  --description 'Short memory information'
complete --command my_memory_mem \
  --short l --long long \
  --description 'Long memory information'

