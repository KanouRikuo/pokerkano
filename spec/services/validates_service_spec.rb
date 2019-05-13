require 'rails_helper'

describe ValidatesService do
  let(:card_class) { Struct.new(:ace) { include ValidatesService } }
  let(:form) { CardForm.new(params) }
  #カードの組が５つあると成功
  describe ".valid1" do
    let(:content1) { card_class.new  }
    context "validation1" do
      let(:params) {'A1 A2 A3 A4 A5'}
      it "valid1を行うとき判定がtrueであること" do
        expect(content1.valid1(params)).to eql true
      end
    end
    context "validation1" do
      let(:params) {'A1 A2 A3 A4'}
      it "valid1を行うとき判定がfalseであること" do
        expect(content1.valid1(params)).to eql false
      end
    end
  end
  # ５つある前提で文字と数字が異なると失敗
  describe ".valid2" do
    context "validation2" do
      let(:content1) { card_class.new('H1 H2 H3 H4 H5')  }
      let(:params) {'H1 H2 H3 H4 H5'}
      it "valid2を行うとき判定がtrueであること" do
        expect(content1.valid2(params)).to eql true
      end
    end
    context "validation2" do
      let(:content1) { card_class.new('Y1 A3 A2 A4 A5')  }
      let(:params) {'Y1 A3 A2 A4 A5'}
      it "valid2を行うとき判定がfalseであること" do
        expect(content1.valid2(params)).to eql false
      end
    end
  end
  describe ".valid3" do
    let(:content1) { card_class.new  }
    context "validation3" do
      let(:params) {'A1 A2 A3 A4 A5'}
      it "valid3を行うとき判定がtrueであること" do
        expect(content1.valid3(params)).to eql true
      end
    end
    context "validation3" do
      let(:params) {'Q1 A2 A2 A4 A5'}
      it "valid3を行うとき判定がfalseであること" do
        expect(content1.valid3(params)).to eql false
      end
    end
  end



  end

  # let(:test_class) { Struct.new(:validates_service) { include ValidatesService } }
  # let(:validates_service) { test_class.new }
  #
  # let(:validates_service) { Struct.new(:validates_service) { include ValidatesService } }
  # let(:validates_service) { validates_service.valid1 }

# let(:card_form) { Struct.new(:ace) { include ValidatesService } }
#
# #カードの組が５つあると成功
# describe ".valid1" do
#   context "validation1" do
#     let(:content1) { card_form.new(ace: 'A1 A2 A3 A4 A5')   }
#
#     it "valid1を行うとき判定がtrueであること" do
#     #
#     # cards = content1.instance_variable_get('@cards')
#     expect(valid1(content1.ace)).to eql true
#
#     end
#
#   end
# end
#
#   let(:card_form) { Struct.new(:ace) { include ValidatesService } }
#   let(:params) {'A1 A2 A3 A4 A5'}
#   #カードの組が５つあると成功
#   describe ".valid1" do
#     context "validation1" do
#       let(:content1) { card_form.new   }
#
#       it "valid1を行うとき判定がtrueであること" do
#       #
#       # cards = content1.instance_variable_get('@cards')
#       expect(content1.valid1(params)).to eql true
#       end
#     end
#   end

#   let(:card_class) { Struct.new(:ace) { include ValidatesService } }
#
#
#   let(:form) { CardForm.new(params) }
#
#   #カードの組が５つあると成功
#   describe ".valid1" do
#     context "validation1" do
#       let(:content1) { card_class.new   }
#       let(:params) {'A1 A2 A3 A4 A5'}
#       it "valid1を行うとき判定がtrueであること" do
#       #
#       # cards = content1.instance_variable_get('@cards')
#       # expect(content1.valid1(params)).to eql true


#
#     end
#     end
#
#   end
# end

#
#   context "validation1" do
#     let(:content2) { card_form.new(' a a a a') }
#
#     it "valid1を行うとき判定がfalseであること" do
#     # cards = content1.instance_variable_get('@cards')
#
#     expect(valid1(content2.ace)).to eql false
#     end
#     end
#
# #５つある前提で文字と数字が異なると失敗
# describe ".valid2" do
#   it "valid2を行うとき判定がtrueであること" do
#     content1 = CardForm.new('H1 H2 H3 H4 H5')
#     cards = content1.instance_variable_get('@cards')
#     expect(valid2(cards)).to eql true
#   end
#
#   it "valid2を行うとき判定がfalseであること" do
#     content1 = CardForm.new('A1 H2 H3 H4 H5')
#     cards = content1.instance_variable_get('@cards')
#     expect(valid2(cards)).to eql false
#   end
# end
# #全てユニークな値であることが成功
# describe ".valid3" do
#   it "valid3を行うとき判定がtrueであること" do
#     content1 = CardForm.new('A1 H2 H3 H4 H5')
#     cards = content1.instance_variable_get('@cards')
#     expect(valid3(cards)).to eql true
#   end
#
#   it "valid3を行うとき判定がfalseであること" do
#     content1 = CardForm.new('H2 H2 H3 H4 H5')
#     cards = content1.instance_variable_get('@cards')
#     expect(valid3(cards)).to eql false
#   end
# end
# end
