package DDG::Spice::Amazon;

use DDG::Spice;

primary_example_queries "ipad 2", "men's watch";
secondary_example_queries "amazon ray bradbury";
description "Search for available products.";
name "Products";
attribution github => ["https://github.com/duckduckgo/", "DuckDuckGo"],
            twitter => ["https://twitter.com/duckduckgo", "DuckDuckGo"];
topics "everyday";
category "special";

spice to => 'https://duckduckgo.com/m.js?q=$1&cb=ddg_spice_amazon';

# trigger on source name
my @source_triggers = ('amazon');

# triggers to pluralize
my @pluralize_triggers = ('product');

# agglomerate triggers
my @triggers = (@source_triggers, @pluralize_triggers, map { $_.'s' } @pluralize_triggers);

# set triggers
#triggers startend => @triggers;

# 2014.05.19 (ct): deep spice.
triggers start => '///***never trigger***///';

handle remainder => sub {
    return "$_" if $_;
};

1;

