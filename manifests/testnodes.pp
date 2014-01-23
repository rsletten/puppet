node 'testcentos3.camstar.local' inherits hadoop {
  include cloudera::manager
}

node 'testcentos4.camstar.local' inherits hadoop {
  include cloudera::agent
}
