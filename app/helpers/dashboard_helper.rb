module DashboardHelper
  def render_transaksi
  	if current_user.admin?
  		render html:
  		'
  		<div class="col-lg-4 col-md-3">
	      <div class="panel panel-primary">
	        <div class="panel-heading">
	          <div class="row">
	            <div class="col-xs-2"><i class="fa fa-medkit fa-5x"></i></div>
	            <div class="col-xs-2" style="padding-left:25px"><i class="fa fa-arrow-circle-up fa-1x"></i></div>
	            <div class="col-xs-8 text-right">
	              <br/><div class="huge"><%= Transaksi.count %></div><br/>
	              <div>Permintaan Obat</div>
	            </div>
	          </div>
	        </div>
	        <a href="#">
	          <div class="panel-footer">
	            <span class="pull-left">View Details</span>
	            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	            <div class="clearfix"></div>
	          </div>
	        </a>
	      </div>
	    </div>
	    <div class="col-lg-4 col-md-3">
	      <div class="panel panel-green">
	        <div class="panel-heading">
	          <div class="row">
	            <div class="col-xs-2"><i class="fa fa-medkit fa-5x"></i></div>
	            <div class="col-xs-2" style="padding-left:25px"><i class="fa fa-arrow-circle-down fa-1x"></i></div>
	            <div class="col-xs-8 text-right">
	              <br/><div class="huge"><%= Transaksi.where(trans_status: [2,3]).count %></div><br/>
	              <div>Dropping Obat</div>
	            </div>
	          </div>
	        </div>
	        <a href="#">
	          <div class="panel-footer">
	            <span class="pull-left">View Details</span>
	            <span class="pull-right"><i class="fa fa-arrow-circle-right">
	              </i></span>
	            <div class="clearfix"></div>
	          </div>
	        </a>
	      </div>
	    </div>
	    <div class="col-lg-4 col-md-3">
	      <div class="panel panel-yellow">
	        <div class="panel-heading">
	          <div class="row">
	            <div class="col-xs-2"><i class="fa fa-medkit fa-5x"></i></div>
	            <div class="col-xs-2" style="padding-left:25px"><i class="fa fa-compress fa-1x"></i></div>
	            <div class="col-xs-8 text-right">
	              <br/><div class="huge"><%= Transaksi.where(trans_status: 3).count %></div><br/>
	              <div>Penerimaan Obat</div>
	            </div>
	          </div>
	        </div>
	        <a href="#">
	          <div class="panel-footer">
	            <span class="pull-left">View Details</span>
	            <span class="pull-right"><i class="fa fa-arrow-circle-right">
	              </i></span>
	            <div class="clearfix"></div>
	          </div>
	        </a>
	      </div>
	    </div>
  		'.html_safe
  	end
  end
end
