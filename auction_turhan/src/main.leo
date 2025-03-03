
program auction_turhan.aleo {
    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    
    transition place_bid(bidder: address, amount: u64) -> Bid {
        assert_eq(self.caller, bidder);
        return Bid {
            owner: aleo1u3072d695sf3fm3y2s4vvj656ln7l8s2ctaxfjecqmpww4u35c8sv6wxqd,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    transition resolve(first: Bid, second: Bid) -> Bid {
        assert_eq(self.caller, aleo1u3072d695sf3fm3y2s4vvj656ln7l8s2ctaxfjecqmpww4u35c8sv6wxqd);
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

  
    transition finish(bid: Bid) -> Bid {
       
        assert_eq(self.caller, aleo1u3072d695sf3fm3y2s4vvj656ln7l8s2ctaxfjecqmpww4u35c8sv6wxqd);
    
        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }
}